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

section .bss    ;secção variáveis
    resultado resd 1    ;reserva epaço double

section .text   ;aqui começa a programação
    global _start   ;label do ponto de entrada do programa

_start:

    mov eax, 0x10000
    add eax, 0x40000
    int SYS_CALL
    sub eax, 0x20000
    mov [resultado], eax
    int 0x80  

    mov eax, SYS_WRITE   ;ativa operação de saída
    mov ebx, STD_OUT     ;para a saída padrão
    mov ecx, [resultado]        ;exibe a mensagem ao usuário
    mov edx, 0x4         ;tamanho da string a ser exibida
    int SYS_CALL        ;passa o comando para o SO

saida:
    ;instruções obrigatórias para encerrar qualquer programa nasm
    mov     eax,SYS_EXIT ;Indica o final de operação, corresponde a System.exit
    mov     ebx,RET_EXIT ;Informa o estado final do programa - 0 sem erro
    int     SYS_CALL    ;implemente chamadas de sistema(syscall), uma forma de os programas do espaço do usuário se comunicarem com o kernel.
