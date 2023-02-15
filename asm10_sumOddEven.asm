%include 'help.asm'

section .data
    open    db  "Nhap lan luot tung so", 0xA, 0x0
    msg1    db  "Tong so le: ", 0x0
    msg2    db  "Tong so chan: ", 0x0
    linenew db  0xA, 0x0
    endin   db  "Ket thuc nhap", 0xA, 0x0

section .bss
    digit   resb 1
    sum1    resb 13
    sum2    resb 13

section .text
    global _start

_start:
    mov rdi, open
    call printStr

    call read_array
    
    mov rdi, msg1
    call printStr

    mov rdi, [sum1]
    mov rsi, sum1
    call decimal_to_string
    mov rdi, sum1
    call printStr
    mov rdi, linenew
    call printStr

    mov rdi, msg2
    call printStr

    mov rdi, [sum2]
    mov rsi, sum2
    call decimal_to_string
    mov rdi, sum2
    call printStr

    mov rdi, linenew
    call printStr

exit:
    mov	rax, SYS_EXIT
	xor	rdi, rdi
	syscall 

read_array:
    read_init:
        push rbp
        mov rbp, rsp

        mov qword [sum1], 0
        mov qword [sum2], 0

    read_start:
        xor rax, rax
        xor rdx, rdx
        xor r8, r8

    read_num:
        push rax
        mov rdi, digit
        mov rsi, 1
        call readStr

        pop rax
        
        xor rcx, rcx
        mov cl, [digit]
        cmp rcx, 0xA   
        je check_end
        cmp rcx, " "  
        je check_end
        
        sub cl, 0x30
        push rcx
        mov rcx, 10 
        mul rcx
        pop rcx     
        add rax, rcx

        cmp cl, 0
        je even
        cmp cl, 2
        je even
        cmp cl, 4
        je even
        cmp cl, 6
        je even
        cmp cl, 8
        je even
        mov r8, 1 
        jmp read_num

    even:
        mov r8, 0
        jmp read_num

    check_end:
        cmp rax, 0
        je done_read

    read_check:
        cmp r8, 1
        je add_odd

    add_even:
        add qword [sum2], rax

        jmp read_start

    add_odd:
        add qword [sum1], rax

        jmp read_start

    done_read:
        mov rdi, endin
        call printStr

        mov rsp, rbp
        pop rbp
        ret

