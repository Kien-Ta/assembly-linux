%include 'help.asm'

section .data
    msg1    db  "So hang 1: ",0x0
    msg2    db  "So hang 2: ",0x0
    msg3    db  "Tong     : ",0x0
    error   db  "Loi dau vao", 0xA, 0x0
    linenew db  0xA, 0x0

section .bss
    num1    resb 512
    num2    resb 512
    sum     resb 512

section .text
    global _start

_start:
    
    mov rdi, msg1
    call printStr

    mov rdi, num1
    mov rsi, 512
    call readStr

    mov rdi, num1           
    call StrToDec  
    mov [num1], rax     
    
    mov rdi, msg2
    call printStr

    mov rdi, num2
    mov rsi, 512
    call readStr

    mov rdi, num2          
    call StrToDec 
    
    add rax, [num1]         
    
    mov rdi, rax
    mov rsi, sum
    call DecToStr

    mov rdi, msg3
    call printStr

    mov rdi, sum
    call printStr

    mov rdi, linenew
    call printStr

exit:
    mov	rax, SYS_EXIT
	xor	rdi, rdi
	syscall 

StrToDec:
    std_init1:
        push rbp
        mov rbp, rsp

        xor rax, rax    
        xor rcx, rcx    
        xor rdx, rdx    
    
    std_continue1:
        mov cl, [rdi]   
        cmp cl, 0x0     
        je std_done1
        cmp cl, 0xA     
        je std_done1
        cmp cl, '0'     
        jb std_invalid1
        cmp cl, '9'     
        ja std_invalid1
        sub cl, 0x30    

        cmp rax, 0x0FFFFFFF
        ja std_invalid1

        
        push rcx    
        mov rcx, 10 
        mul rcx
        pop rcx     
        add rax, rcx

        cmp rax, 0x7FFFFFFF
        ja std_invalid1

        inc rdi
        jmp std_continue1

    std_invalid1:
        mov rdi, error
        call printStr
        jmp exit

    std_done1:
        mov rsp, rbp
        pop rbp
        ret 

DecToStr:
    dts_init1:
        push rbp
        mov rbp, rsp
        mov rax, rdi    
        xor rcx, rcx    
    
    dts_continue1:
        xor rdx, rdx    
       
        push rcx
        mov rcx, 10
        div rcx
        pop rcx
        push rdx
        inc rcx
        cmp rax, 0      
        je dts_done1
        jmp dts_continue1
    
    dts_done1:
        pop rdx     
        add rdx, 0x30   
        mov [rsi], rdx  
        inc rsi       
        loop dts_done1
    
    dts_end1:
        mov rsp, rbp
        pop rbp
        ret

