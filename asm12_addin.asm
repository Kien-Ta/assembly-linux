strlen: 
    push rbp
    mov rbp, rsp

    mov rax, rdi
checkLoop:
    cmp byte [rax], 0
    jz strlenFns
    inc rax
    jmp checkLoop

strlenFns:
    sub rax, rdi 
    leave
    ret
    


strPrint: 
    push rbp
    mov rbp, rsp
    push rbx 

    call strlen 

    mov rdx, rax 

    mov rax, SYS_WRITE 
    mov rsi, rdi
    mov rdi, STDOUT

    syscall
    pop rbx
    leave
    ret

numToStr:
    push rbp
    mov rbp, rsp

    push rbx
    xor rcx, rcx
    mov rax, rdi 

divideLoop:
    inc rcx 
    xor rdx, rdx
    mov rbx, 10
    div rbx 
    add dl, '0' 
    push rdx 
    cmp rax, 0 
    jnz divideLoop

popChrLoop:
    pop rax 
    mov byte [rsi], al 
    inc rsi 

loop popChrLoop 
    pop rbx
    leave
    ret


uint64Print: 
    push rbp
    mov rbp, rsp

    sub rsp, 0x20 

    mov qword [rsp], 0
    mov qword [rsp+8], 0
    mov qword [rsp+10h], 0
    mov qword [rsp+12h], 0

    lea rsi, [rsp]
    call numToStr
    lea rdi, [rsp]
    call strPrint

    leave
    ret

int64Print:
    push rbp
    mov rbp, rsp

    test rdi, rdi
    jns IPlabel1
    push rdi
    lea rdi, [minus]
    call strPrint
    pop rdi
    neg rdi
IPlabel1:
    call uint64Print
    leave
    ret
