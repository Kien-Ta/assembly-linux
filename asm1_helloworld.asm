section	.text	     ; code segment
   global _start

_start:	             ; entry point
   mov	rdx, len     ; arg1
   mov	rsi, msg     ; arg2
   mov	rdi, 1       ; arg3 - write to stdout
   mov	rax, 1       ; sys_write
   syscall           ; system call

   mov	eax, 0x3c    ; sys_exit
   xor   rdi, rdi    ; error_code = 0
   syscall           

section	.data       ; data Segment
msg db 'Hello World!', 0xa, 0x0  
len equ $ - msg     ; length of string
