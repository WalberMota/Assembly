;Compilação:
;Para gerar o programa compilado "shello.o" : "nasm -f elf64 hello.asm"
;Linkedição:
;Para gerar um executável : ld -s -o hello hello.o


section .data
    msg db "Ola assembly!"   ;referencia para criar a string com ASCII de line feed
    tam equ $- msg           ;obtém o tamanho da msg

section .bss

section .text

global _start

_start:
    mov     EAX,0x4     ; instrução de mandar algo para stdout (saída padrão)
    mov     EBX, 0x1    ; informa saída padrão
    mov     ECX,msg     ;
    mov     EDX,tam     ;
    int 0x80

saida:
    ;as três instruções abaixo são obrigatórias para encerrar qualquer programa nasm
    mov     eax,0x1 ;Indica o final de operação, corresponde a System.exit
    mov     ebx,0x0 ;return 0
    int     0x80    ;implemente chamadas de sistema(syscall), uma forma de os programas do espaço do usuário se comunicarem com o kernel.
