;Prova de que o IAs nunca vão substituir um programador de assembly


section .data
    num1 dd 10
    num2 dd 20
    fmt db 'A sma de %d e %d é %d', 10, 0
    ;sum dd 00

section .text
    global _start

_start:

    mov eax, [num1]
    add eax,[num2]
    mov [sum], eax

    ;imprime o resultado
    push dword[sum]
    push dword[num2]
    push dword[num1]
    push dword fmt
    call printf




    ;Sai do programaa
    mov eax,1
    xor ebx,ebx
    int 0x80