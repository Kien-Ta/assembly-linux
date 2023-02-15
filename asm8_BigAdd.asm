%include 'help.asm'

section .data
    linenew db  0xA, 0x0

section .bss
    num1    resb 100
    num2    resb 100
    sum     resb 100

section .text
    global _start

_start:
    mov rdi, num1
    mov rsi, 100
    call readStr
    
    mov rdi, num2
    mov rsi, 100
    call readStr

    mov rdi, num1 
    mov rsi, num2
    mov rdx, sum
    call calculate_sum

    mov rdi, sum
    call printStr

    mov rdi, linenew
    call printStr

exit:
    mov	rax, SYS_EXIT
	xor	rdi, rdi
	syscall 


calculate_sum:
    push rbp
    mov rbp, rsp

    %define num1 rbp + 16
    %define num2 rbp + 116
    
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