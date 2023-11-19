;Compilação:
;Para gerar o programa compilado "shello.o" : "nasm -f elf64 hello.asm"
;Linkedição:
;Para gerar um executável : ld -s -o hello hello.o


section .data
    msg db "Ola assembly!"  ;referencia para criar a string 
    tam equ $- msg          ;obtém o tamanho da msg

section .bss

section .text

global _start

_start:
    mov     EAX,0x4     ; instrução de mandar algo para stdout (saída padrão)
    mov     EBX, 0x1    ; informa saída padrão
    mov     ECX,msg     ;
    mov     EDX,tam     ;

    ;as três instruções abaixo são obrigatórias para encerrar qualquer programa nasm
    mov     eax,0x1 ;terminando o programa
    mov     ebx,0x0 ;return 0
    int     0x80
