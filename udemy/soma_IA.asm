;rotina dever avaliada por GDB
;
section .data
    num1 dd 5 ; primeiro número
    num2 dd 7 ; segundo número

section .bss
    result resd 1 ; reserva espaço para o resultado

section .text
    global _start
_start:
    ; carrega os números na memória
    mov eax, [num1]
    mov ebx, [num2]

    ; some os números
    add eax, ebx

    ; armazena o resultado
    mov [result], eax

    ; finaliza o programa
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; retorna 0
    int 0x80 ; chama o kernel