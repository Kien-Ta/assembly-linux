%include 'help.asm'


section .data
    
section .bss
    inp_str resb 512

section .text
    global _start

_start:

    mov rdi, inp_str
    mov rsi, 512
    call readStr

    mov rdi, inp_str  
    call upper_string

    mov rdi, inp_str
    call printStr

exit:
	mov	rax, SYS_EXIT
	xor	rdi, rdi
	syscall

upper_string:
    upper_init:
        push rbp
        mov rbp, rsp
    
    upper_main:
        mov al, [rdi]   
        cmp al, 0x0     
        je upper_done         
        cmp al, 'a'     
        jb upper_next_char
        cmp al, 'z'     
        ja upper_next_char
        sub al, 0x20    
        mov [rdi], al   

    upper_next_char:
        inc rdi         
        jmp upper_main

    upper_done:
        mov rsp, rbp
        pop rbp
        ret             
