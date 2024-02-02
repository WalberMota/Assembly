; entrada.asm
; Programa para Entrada de Dados
;
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

section .data   ;esta seção é apenas para termo constantes
    msg db "Entre com seu nome: ",LF,NULL
    tam equ $- msg

section .bss    ;esta seção, em tese, colocamos as nossas variáveis
    nome resb 1 ;cria uma variável 'nome' que vai receber bytes de informação.
                ;(armazenas informações de byte em byte não tem haver com tamanho da variável).

section .text   ;aqui informa onde começa a programação

global _start  ;cria um label para o ponto de entrada do programa

_start:
    ;aqui ocorre a saida para o usuário (cout)
    mov eax,SYS_WRITE   ;ativa operação de saída
    mov ebx,STD_OUT     ;para a saída padrão
    mov ecx, msg        ;exibe a mensagem ao usuário
    mov edx,tam         ;tamanho da string a ser exibida
    int SYS_CALL        ;passa o comando para o SO

    ;aqui ocorre a entrada dos dados fornecidos pelo usuário(cin)
    mov eax,SYS_READ    ;ativa operação de leitura
    mov ebx,STD_IN      ;para receber pela entrada padrão
    mov ecx, nome       ;recebe o nome
    mov edx,0xA         ;é obrigatório informar uma quantidade de caracteres 0xA=10
    int SYS_CALL        ;passa o comando para o SO

end: ;aqui usamos as instruções para fiinalizar o programa.
    mov eax,SYS_EXIT
    mov ebx,RET_EXIT
    int SYS_CALL        ;passa o comando para o SO
