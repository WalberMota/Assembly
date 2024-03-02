section .data

    msg1 db "Não entre em pânico!",10           
    len1 equ $ - msg1

    msg2 db "e sempre carregue uma toalha.", 10,0  
    len2 equ $ - msg2

section .text

    global _start

_start:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, len1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len2
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
