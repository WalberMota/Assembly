;Compilação:
;Para gerar o programa compilado "shello.o" : "nasm -f elf64 hello.asm"
;Linkedição:
;Para gerar um executável : ld -s -o hello hello.o


section .data

section .bss

section .text

global _start

_start:
    ;mov destino.origem
    mov     eax,0x1 ;terminando o programa
    mov     ebx,0x0 ;return 0
    int     0x80
