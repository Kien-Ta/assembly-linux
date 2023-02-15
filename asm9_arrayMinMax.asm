%include 'help.asm'

section .data
    open    db  "Nhap lan luot tung so", 0xA, 0x0

    msg1    db  "So lon nhat: ", 0x0

    msg2    db  "So nho nhat: ", 0x0

    endin   db  "Ket thuc nhap", 0xA, 0x0

    linenew db  0xA, 0x0

section .bss
    digit   resb 11
    min     resb 11
    max     resb 11
    
section .text
    global _start

_start:
    mov rdi, open
    call printStr

    call read_array
    
    mov rdi, [max]
    mov rsi, max
    call decimal_to_string

    mov rdi, msg1
    call printStr
    mov rdi, max
    call printStr
    mov rdi, linenew
    call printStr

    mov rdi, [min]
    mov rsi, min
    call decimal_to_string
    
    mov rdi, msg2
    call printStr
    mov rdi, min
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

        mov qword [max], 0
        mov qword [min], 0xffffffffffffffff

    read_start:
        xor rax, rax
        xor rdx, rdx

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
        jmp read_num

    check_end:
        cmp rax, 0
        je done_read

    check_min:
        cmp rax, qword [min]
        jb update_min

    check_max:
        cmp rax, qword [max]
        ja update_max
        
        jmp read_start

    update_min:
        mov qword [min], rax
        jmp check_max

    update_max:
        mov qword [max], rax
    
        jmp read_start

    done_read:
        mov rdi, endin
        call printStr
        
        mov rsp, rbp
        pop rbp
        ret





