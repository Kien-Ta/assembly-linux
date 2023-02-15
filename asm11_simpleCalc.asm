%include 'help.asm'

section .data
    open    db  "Chon 1 trong 4 tuy chon: ", 0xA, \
    "1. Cong ", 0xA, \
    "2. Tru ", 0xA, \
    "3. Nhan ", 0xA, \
    "4. Chia ", 0xA, 0x0
    msg2    db  "Nhap hai toan hang, moi toan hang tren mot dong ", 0xA, 0x0
    msg3    db  "So chia khong hop le ", 0xA, 0x0
    result    db  "Ket qua: ", 0x0
    linenew db  0xA, 0x0
    endcalc db  "Ket thuc tinh toan", 0xA, 0x0

section .bss
    ope     resb 2
    num1    resb 11
    num2    resb 11
    res     resb 11

section .text
    global _start

_start:

whiletrue:
    mov rdi, open
    call printStr
   
    mov rdi, ope
    mov rsi, 2
    call readStr

    mov al, [ope]
    cmp al, '1'
    je continue 
    cmp al, '2'
    je continue
    cmp al, '3'
    je continue
    cmp al, '4'
    je continue
    jmp exit
    
continue:
    mov rdi, msg2
    call printStr

    mov rdi, num1
    mov rsi, 11
    call readStr
    mov rdi, num2
    mov rsi, 11
    call readStr

    mov rdi, num1
    call string_to_decimal
    mov [num1], rax

    mov rdi, num2
    call string_to_decimal
    mov [num2], rax

    mov al, [ope]
    cmp al, '1'
    je Addition 

    cmp al, '2'
    je Subtraction

    cmp al, '3'
    je Multiplication

    cmp al, '4'
    je Division


print:
    mov rdi, result
    call printStr

    mov rdi, res
    call printStr

    mov rdi, linenew
    call printStr

    jmp whiletrue

exit:
    mov rdi, endcalc
    call printStr

    mov	rax, SYS_EXIT
	xor	rdi, rdi
	syscall 


Addition:
    mov rax, [num1]
    add rax, [num2]
    mov rdi, rax
    mov rsi, res
    call decimal_to_string
    jmp print

Subtraction:
    mov rax, [num1]
    sub rax, [num2]
    mov rdi, rax
    mov rsi, res
    call decimal_to_string
    jmp print

Multiplication:
    xor rdx, rdx
    mov rax, [num1]
    mov rbx, [num2]
    mul rbx
    mov rdi, rax
    mov rsi, res
    call decimal_to_string
    jmp print

Division:
    xor rdx, rdx
    mov rax, [num1]
    mov rbx, [num2]
    cmp rbx, 0
    je invalid
    div rbx
    mov rdi, rax
    mov rsi, res
    call decimal_to_string
    jmp print


invalid:
    mov rdi, msg3
    call printStr
    jmp whiletrue

