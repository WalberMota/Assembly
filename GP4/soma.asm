;Prova de que o IAs nunca vão substituir um programador de assembly


section .data
    num1 dd 10
    num2 dd 20
    fmt db 'A sma de %d e %d é %d', 10, 20
    sum dd 00

section .text
    global _start

_start:

    mov eax, [num1]
    add eax,[num2]
    mov [sum], eax

    ;imprime o resultado
    ;push dword[sum]
    ;push dword[num2]
    ;push dword[num1]
    ;push dword fmt
    ;call printf
    mov     EAX,0x4     ; instrução de mandar algo para stdout (saída padrão)(ox3=read; 0x4=write)
    mov     EBX, 0x1    ; informa saída padrão,System.out. 0x0 para entrada de valor, System.in
    mov     ECX,[sum]     ;
    ;mov     EDX,tam     ;
    int 0x80



    ;Sai do programaa
    mov eax,1
    xor ebx,ebx
    int 0x80