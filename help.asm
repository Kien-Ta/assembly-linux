SYS_READ 	equ 0
SYS_WRITE	equ 1
STDIN		equ 0
STDOUT		equ 1
SYS_EXIT 	equ 0x3c

; calculate strlen of string
strlen:
    strlen_init:
        push rbp
        mov rbp, rsp

        ; reset value 
        xor rax, rax

    strlen_loop:
        ; if null character
        cmp byte [rdi], 0
        je strlen_done
        inc rdi
        inc rax
        jmp strlen_loop

    strlen_done:
        mov rsp, rbp
        pop rbp
        ret

; print string to stdout
printStr:
    push rbp
    mov rbp, rsp

    mov rsi, rdi    ; arg0 for write syscall
    call strlen
    mov rdx, rax    ; arg2 for write syscall
    mov rax, SYS_WRITE 
    mov rdi, STDOUT ; arg1 for write syscall
    syscall

    mov rsp, rbp
    pop rbp
    ret

; read string from stdin
readStr:
    push rbp
    mov rbp, rsp

    mov rdx, rsi    ; arg2
    mov rsi, rdi    ; arg1
    mov rax, SYS_READ 
	mov rdi, STDIN  ; arg0
    syscall

    mov rsp, rbp
    pop rbp
    ret

; Convert string to decimal number
string_to_decimal:
    std_init:
        push rbp
        mov rbp, rsp

        xor rax, rax    
        xor rcx, rcx    
        xor rdx, rdx    
    
    std_continue:
        mov cl, [rdi]   ; Get digit character
        cmp cl, 0x0     ; Check if null character
        je std_done
        cmp cl, 0xA     ; Check if enter character
        je std_done
        sub cl, 0x30

        ; rax = rax * 10 + rcx
        push rcx    ; push rcx value to stack
        mov rcx, 10 
        mul rcx
        pop rcx     ; get value from stack
        add rax, rcx

        inc rdi     ; next pointer
        jmp std_continue

    std_done:
        mov rsp, rbp
        pop rbp
        ret 

; Convert decimal number to string
decimal_to_string:
    dts_init:
        push rbp
        mov rbp, rsp
        mov rax, rdi    ; decimal number
        xor rcx, rcx    ; rcx = 0
    
    dts_continue:
        xor rdx, rdx    ; rdx = 0 for divider
       
        ; Divide 10, remainder is digit, push it to stack to reverse. Using rcx for count number of digits.
        push rcx
        mov rcx, 10
        div rcx
        pop rcx
        push rdx
        inc rcx
        cmp rax, 0      ; if rax = 0, end
        je dts_done
        jmp dts_continue
    
    dts_done:
        pop rdx     ; get digit
        add rdx, 0x30   ; convert to ascii
        mov [rsi], rdx  ; move digit value in ascii to rsi pointer
        inc rsi         ; increase pointer to next character
        loop dts_done
    
    dts_end:
        mov rsp, rbp
        pop rbp
        ret

        
