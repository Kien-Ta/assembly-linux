%include 'help.asm'

SYS_EXIT 	equ 0x3c


section .data

section .bss
    res     resb 512

section .text
	global _start

_start:
    mov rdi, res
    mov rsi, 512
    call readStr

    mov rdi, res
    call printStr

exit:
	mov	rax, SYS_EXIT
	xor	rdi, rdi
	syscall
