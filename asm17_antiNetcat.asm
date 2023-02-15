bits 64
default rel

%define SIGEV_SIGNAL	0
%define SIGUSR1      10
%define SA_RESTORER   0x04000000
%define CLOCK_REALTIME 0

STRUC SIGACTION
    .sa_handler:      resq      1
    .sa_flags:        resq      1
    .sa_restorer:     resq      1
    .sa_mask:         resb      128
ENDSTRUC

STRUC SIGEVENT
    .sigev_value:       resb      8
    .sigev_signo:       resd      1
    .sigev_notify:      resd      1
    .pad:               resb      48
ENDSTRUC

STRUC ITIMERSPEC
    .it_interval_tv_sec:      resq    1
    .it_interval_tv_nsec:     resq    1
    .it_value_tv_sec:	      resq    1
    .it_value_tv_nsec:	      resq    1
ENDSTRUC



section .data
	cmd	db	"/usr/bin/pkill", 0
	arg1	db	"-x", 0
	arg2	db	"nc", 0
	args	dq	cmd, arg1, arg2, 0
	
	timerId	dq	0
	
	event istruc SIGEVENT
        at      SIGEVENT.sigev_value, times 8 db 0
        at      SIGEVENT.sigev_signo, dd        0
        at      SIGEVENT.sigev_notify, dd       0
        at      SIGEVENT.pad,   times 48 db     0
        iend

        act istruc SIGACTION
        at      SIGACTION.sa_handler, dq 0
        at      SIGACTION.sa_flags, dq 0
        at      SIGACTION.sa_restorer, dq 0
        at      SIGACTION.sa_mask, times 128 db 0
        iend

        timer istruc ITIMERSPEC
        at      ITIMERSPEC.it_interval_tv_sec, dq 10
        at      ITIMERSPEC.it_interval_tv_nsec, dq 0
        at      ITIMERSPEC.it_value_tv_sec, dq 10
        at      ITIMERSPEC.it_value_tv_nsec, dq 0
        iend
section .bss
	

section .text
global _start
_start:
	push	rbp
	mov	rbp, rsp

	mov	QWORD [act+SIGACTION.sa_handler], sig_handler
	mov	QWORD [act+SIGACTION.sa_flags], SA_RESTORER
	mov	QWORD [act+SIGACTION.sa_restorer], restorer

; rt_sigaction
	mov	rax, 13
	mov	rdi, SIGUSR1
	mov	rsi, act
	mov	rdx, 0
	mov	r10, 8
	syscall

	mov	dword [event+SIGEVENT.sigev_notify], SIGEV_SIGNAL
	mov	dword [event+SIGEVENT.sigev_signo], SIGUSR1

; timer_create
	mov	rax, 222
	mov	rdi, CLOCK_REALTIME
	mov	rsi, event
	mov	rdx, timerId
	syscall

; timer_settime
	mov	rax, 223
	mov	rdi, [timerId]
	mov	rsi, 0
	mov	rdx, timer
	mov	r10, 0
	syscall

looper:
	jmp	looper

; exit ?
	mov	rax, 0
	syscall


sig_handler:
	push	rbp
	mov	rbp, rsp

; fork
	mov	rax, 57
	syscall	
	cmp	rax, 0
	jne	leave_handler

;terminate netcat - execve 
	mov	rax, 0x3b
	mov	rdi, cmd
	mov	rsi, args
	mov	rdx, 0
	syscall

leave_handler:
	leave
	ret

restorer:
; rt_sigreturn
	mov	rax, 15
	syscall
	ret