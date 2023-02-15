%include 'help.asm'

section .data
    msg1    db  "String: ",0x0

    msg2    db  "Pattern: ",0x0

    linenew db  0xA, 0x0
    
    space   db  " ", 0x0

section .bss
    string      resb 100
    pattern   resb 10
    trace       resb 100
    res         resb 8

section .text
	global _start

_start:
    mov rdi, msg1
    call printStr

    mov rdi, string
    mov rsi, 100
    call readStr

    mov rdi, msg2
    call printStr

    mov rdi, pattern
    mov rsi, 10
    call readStr

    mov rdi, string
    mov rsi, pattern
    mov rdx, trace
    call check_substr
    mov [res], rax

    call print

    mov rdi, linenew
    call printStr

exit:
    mov	rax, SYS_EXIT
	xor	rdi, rdi
	syscall 

check_substr:
    check_init:
        push rbp
        mov rbp, rsp

        xor rax, rax    
        xor r8, r8  

    check_start:
        push r8     
        xor r9, r9  
        xor rcx, rcx
        xor rbx, rbx

    check_main:
        mov cl, [rdi + r8]
        mov bl, [rsi + r9]
        cmp bl, 0x0
        je is_substr

        cmp bl, 0xA
        je is_substr

        cmp cl, 0x0
        je check_done

        cmp cl, 0xA
        je check_done

        cmp cl, bl
        jne not_substr

        inc r8
        inc r9
        jmp check_main
        
    
    is_substr:
        inc rax 

        pop r8
        mov [rdx], r8
        inc rdx

        inc r8 
        jmp check_start

    not_substr:
        pop r8
        inc r8 
        jmp check_start

    check_done:
        pop r8 
        mov rsp, rbp
        pop rbp
        ret

print:
    push rbp
    mov rbp, rsp

    mov r8, [res]
    
    mov rdi, [res]
    mov rsi, res
    call decimal_to_string

    mov rdi, res
    call printStr

    mov rdi, linenew
    call printStr
    
    print_array:
        mov rax, trace
        
        cmp r8, 0
        je print_done

        print_loop:
            xor rbx, rbx
            mov bl, [rax]
            push rax   

            mov qword [res], 0
            mov rdi, rbx
            mov rsi, res
            call decimal_to_string

            mov rdi, res
            call printStr

            mov rdi, space
            call printStr

            pop rax 
            inc rax 
            
            dec r8  
            cmp r8, 0
            jne print_loop

    print_done:
        mov rsp, rbp
        pop rbp
        ret
