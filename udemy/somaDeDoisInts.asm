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
    numhexa resb 2
    result resb 2    ;reserva espaço na memoria
    tam equ $- result ; tamanho da ṕarea criada

section .text   ;aqui começa a programação
    global _start   ;label do ponto de entrada do programa

_start:

    ; mov eax, 0x3
    ; add eax, 0x2
    ; mov [numhexa], eax
    ; int SYS_CALL


    mov eax, 0x95
    mov ebx, 0xf  ; Peso da posição mais à direita
    mov ecx, 0x0  ; Resultado da conversão
@loop:
    xor edx, edx  ; Limpar o registrador EDX
    div ebx      ; Dividir EAX por 16
    add ecx, edx  ; Acumular o resto da divisão na variável dec_number
    ;smov [result],ecx

    mul ebx      ; Multiplicar o quociente por 16
    cmp eax, 0x0   ; Verificar se todos os dígitos foram processados
    jne @loop

    mov [result], ecx ; Armazenar o resultado em dec_number


    mov eax, SYS_WRITE   ;ativa operação de saída
    mov ebx, STD_OUT     ;para a saída padrão
    
    mov ecx, result      ;exibe a mensagem ao usuário
    mov edx, tam         ;tamanho da string a ser exibida
    int SYS_CALL        ;passa o comando para o SO

saida:
    ;instruções obrigatórias para encerrar qualquer programa nasm
    mov     eax,SYS_EXIT ;Indica o final de operação, corresponde a System.exit
    mov     ebx,RET_EXIT ;Informa o estado final do programa - 0 sem erro
    int     SYS_CALL    ;implemente chamadas de sistema(syscall), uma forma de os programas do espaço do usuário se comunicarem com o kernel.
