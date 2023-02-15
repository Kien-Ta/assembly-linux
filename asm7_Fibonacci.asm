%include 'help.asm'

section .data
    first_fibo      db "0", 0x0
    second_fibo     db "1", 0x0
    space           db " ", 0x0
    linenew         db 0xA, 0x0

section .bss
    num             resb 8

section .text
    global _start

_start:
    mov rdi, num 
    mov rsi, 8
    call readStr

    mov rdi, num 
    call string_to_decimal
    mov [num], rax

    mov rax, [num]
    cmp rax, 1
    jb exit

    mov rdi, first_fibo
    call printStr
    mov rdi, linenew
    call printStr

    mov rax, [num]
    cmp rax, 2
    jb exit

    mov rdi, second_fibo
    call printStr
    mov rdi, linenew
    call printStr

    mov rdi, [num]
    call cal_fibo

exit:
    mov	rax, SYS_EXIT
	xor	rdi, rdi
	syscall 


cal_fibo:
    push rbp
    mov rbp, rsp
    
    sub rsp, 90
    %define num1    rbp - 30
    %define num2    rbp - 60
    %define sum     rbp - 90

    mov r8, rdi
    cmp r8, 3
    jb cal_done

    dec r8
    dec r8

    mov qword [num2], 31h
    mov qword [num1], 30h
    
    cal_loop:
        lea rdi, [num1]
        lea rsi, [num2]
        lea rdx, [sum]
        call calculate_sum

        lea rdi, [sum]
        call printStr
        mov rdi, linenew
        call printStr

        lea rdi, [num2]
        lea rsi, [num1]
        call move

        lea rdi, [sum]
        lea rsi, [num2]
        call move
        
        dec r8
        cmp r8, 0
        je cal_done
        jmp cal_loop


    cal_done: 
        add rsp, 90
        mov rsp, rbp
        pop rbp
        ret

move:
    push rbp
    mov rbp, rsp
    
    loop_move:
        xor rax, rax
        mov al, [rdi]
        cmp al, 0x0
        je done_move
        cmp al, 0xA
        je done_move
        mov [rsi], al
        inc rdi
        inc rsi
        jmp loop_move

    done_move:
        mov byte [rsi], 0x0
        mov rsp, rbp
        pop rbp
        ret

calculate_sum:
    push rbp
    mov rbp, rsp

    %define num1 rbp + 16
    %define num2 rbp + 46
    
    mov r9, rsi
    lea rsi, [num1]
    call move

    mov rdi, r9
    lea rsi, [num2]
    call move

    lea rdi, [num1]
    call strlen
    mov rsi, rax   

    lea rdi, [num2]
    call strlen
    mov rdi, rax    

    xor rax, rax
    xor rcx, rcx
    xor r9, r9      

    add_loop:
        cmp rsi, 0
        je add_case1
    
        cmp rdi, 0
        je add_case2

        dec rsi
        dec rdi
        mov al, [num1 + rsi]
        sub al, 0x30
        mov bl, [num2 + rdi]
        sub bl, 0x30
        add al, bl
        add rax, r9  
        cmp al, 10
        jae add_loop_carry
        xor r9, r9 
        jmp add_loop_continue

    add_loop_carry:
        mov r9, 1  
        sub al, 10

    add_loop_continue:
        add al, 0x30
        push rax
        inc rcx
        jmp add_loop

    add_case1:
        cmp rdi, 0
        je check_carry
        dec rdi
        mov al, [num2 + rdi]
        sub al, 0x30
        add rax, r9  
        cmp al, 10
        jae add_case1_carry
        xor r9, r9  
        jmp add_case1_continue

    add_case1_carry:
        mov r9, 1   
        sub al, 10

    add_case1_continue:
        add al, 0x30
        push rax
        inc rcx
        jmp add_case1

    add_case2:
        cmp rsi, 0
        je check_carry
        dec rsi
        mov al, [num1 + rsi]
        sub al, 0x30
        add rax, r9  
        cmp al, 10
        jae add_case2_carry
        xor r9, r9  
        jmp add_case2_continue

    add_case2_carry:
        mov r9, 1   
        sub al, 10

    add_case2_continue:
        add al, 0x30
        push rax
        inc rcx
        jmp add_case2

    check_carry:
        cmp r9, 1   
        jb create_sum

    add_carry:
        mov al, 31h
        push rax
        inc rcx

    create_sum:
        pop rax
        mov [rdx], al
        inc rdx
        loop create_sum

    mov rsp, rbp
    pop rbp
    ret    