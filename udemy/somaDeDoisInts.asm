; ;.386
; ;.model flat,stdcall
; ;.stack 4096
; ;.code
; ;main Proc
;     mov eax, 10000h
;     add eax, 40000h
;     sub eax, 20000h
;     int 0x80  
;     ret
; ;main ENDP
; ;END main

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


section .text   ;aqui começa a programação

global _start   ;label do ponto de entrada do programa

_start:

    mov eax, 10000h
    add eax, 40000h
    sub eax, 20000h
    int 0x80  

saida:
    ;instruções obrigatórias para encerrar qualquer programa nasm
    mov     eax,0x1 ;Indica o final de operação, corresponde a System.exit
    mov     ebx,0x0 ;Informa o estado final do programa - 0 sem erro
    int     0x80    ;implemente chamadas de sistema(syscall), uma forma de os programas do espaço do usuário se comunicarem com o kernel.
