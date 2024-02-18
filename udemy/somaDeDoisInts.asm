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
section .text

global _start

_start:

    mov eax, 10000h
    add eax, 40000h
    sub eax, 20000h
    int 0x80  


saida:
    ;as três instruções abaixo são obrigatórias para encerrar qualquer programa nasm
    mov     eax,0x1 ;Indica o final de operação, corresponde a System.exit
    mov     ebx,0x0 ;Informa o estado final do programa - 0 sem erro
    int     0x80    ;implemente chamadas de sistema(syscall), uma forma de os programas do espaço do usuário se comunicarem com o kernel.
