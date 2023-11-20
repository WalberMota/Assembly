; entrada.asm
; Programa para Entrada de Dados
;
segment .data
    LF          equ 0xA ; Line Feed
    SYS_CALL    equ 0x80 ; Envia informacao ao SO
    NULL        equ 0xD ; Final da String
    ;EAX
    SYS_EXIT    equ 0x1 ; Codigo de chamada para finalizar
    SYS_READ    equ 0x3 ; Operacao de Leitura
    SYS_WRITE   equ 0x4 ; Operacao de Escrita
    ;EBX
    RET_EXIT    equ 0x0 ; Operacao com Sucesso
    STD_IN      equ 0x0 ; Entrada padrao
    STD_OUT     equ 0x1 ; Saida padrao
    
    
    