segment .data
    LF          equ 0xA  ; Line Feed (\n)
    SYS_CALL    equ 0x80 ; Envia informacao ao SO
    NULL        equ 0xD  ; ponteiro para o final da cadeia de caracteres(Final da String)

    ;EAX -------Registrador que usa estas instruções
    SYS_READ    equ 0x3 ; Operacao de Leitura
    SYS_WRITE   equ 0x4 ; Operacao de Escrita
    SYS_EXIT    equ 0x1 ; Codigo de chamada para finalizar

    ;EBX -------Registrador que usa estas instruções
    STD_IN      equ 0x0 ; Entrada padrao
    STD_OUT     equ 0x1 ; Saida padrao
    RET_EXIT    equ 0x0 ; Operacao realizada com Sucesso

section .data
; db - define byte (1 byte = 8 bits); dw (define word = um char 2 bytes = 16 bites); dd - define dobleword = 32 bits (4 bytes);dq define quadword 64 bits(8 bytes); dt (10 bytes)
    x dd 50             
    y dd 10
    msg1 db "X maior que Y",LF,NULL
    tam1 equ $- msg1
    msg2 db "Y maior que X",LF,NULL
    tam2 equ $- msg2
    msg3 db "Y igual à X",LF,NULL
    tam2 equ $- msg3

section .text

global _start

_start:
    mov EAX,DWORD[x]
    mov EBX,DWORD[y]
    ; instrução de comparação.
    cmp EAX,EBX
    jge maior; se x >= y salta para label maior:
    ;casos contrário - x < y, executa as instruções abaixo
    mov ECX,msg2 ; mostra mensagem quando x < y
    mov EDX,tam2
    jmp final

maior:
    mov ECX, msg1; mostra a mensagem quando x >= y
    mov EDX, tam1

final:
    mov EAX,SYS_WRITE   ;instrução de escrita
    mov EBX,STD_OUT     ;saída padrão
    int SYS_CALL

    mov EAX,SYS_EXIT    ;final da operação
    xor EBX,EBX         ;pode usar mov EBX,RET_EXIT - estado de retorno 0
    int SYS_CALL        ;executar - System.exit


    ;Saltos condicionais:
    ; je  - salte para... se = 
    ; jg  - salte para... se >
    ; jge - salte para... se >=
    ; jl  - salte para... se <
    ; jle - salte para... se <=
    ; jne - salte para...se != (diferente)
    ; Salto incondicional:
    ; jmp - goto ...

