%include 'help.asm'

section .data

section .bss
    string resb 512
    result resb 512

section .text
    global _start

_start:
    mov rdi, string
    mov rsi, 512
    call readStr

    mov rsi, result
    mov rdi, string
    call reverse

    mov rdi, result
    call printStr
    
exit:
    mov	rax, SYS_EXIT
	xor	rdi, rdi
	syscall 

reverse:
    reverse_init:
        push rbp
        mov rbp, rsp

        xor rax, rax
        xor rcx, rcx   
    
    
    find_end:
        mov al, [rdi]
        
        cmp al, 0x0
        je swap

        cmp  al, 0xA
        je swap

        push rax
        inc rdi
        inc rcx
        jmp find_end

    swap:
        pop rax
        mov [rsi], rax
        inc rsi
        loop swap
        
    reverse_done:
        mov rsp, rbp
        pop rbp
        ret
