;Walber Mota
;Compilação:
;Para gerar o programa compilado "hello.o" : "nasm -f elf64 hello.asm"
;Linkedição:
;Para gerar um executável : ld -s -o hello hello.o
;run: ./hello


section .data
    msg db "Primeiro Programa em Assembly", 0xA, "Aqui é outra linha", 0xA   ;referencia para criar a string com ASCII de line feed
    tam equ $- msg           ;obtém o tamanho da msg

section .bss

section .text

global _start

_start:
    mov     EAX,0x4     ; instrução de mandar algo para stdout (saída padrão)(ox3=read; 0x4=write)
    mov     EBX, 0x1    ; informa saída padrão,System.out. 0x0 para entrada de valor, System.in
    mov     ECX,msg     ;
    mov     EDX,tam     ;
    int 0x80            ;Envia a informacao ao Sistema Operacional (kernel)

saida:
    ;as três instruções abaixo são obrigatórias para encerrar qualquer programa nasm
    mov     eax,0x1 ;Indica o final de operação, corresponde a System.exit
    mov     ebx,0x0 ;Informa o estado final do programa - 0 sem erro
    int     0x80    ;implemente chamadas de sistema(syscall), uma forma de os programas do espaço do usuário se comunicarem com o kernel.
