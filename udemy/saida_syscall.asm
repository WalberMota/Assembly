; segment .data
;     LF          equ 0xA  ; Line Feed (\n)
;     SYS_CALL    equ 0x80 ; Envia informacao ao SO
;     NULL        equ 0xD  ; ponteiro para o final da cadeia de caracteres(Final da String)

;     ;rax -------Registrador que usa estas instruções
;     SYS_READ    equ 0x3 ; Operacao de Leitura
;     SYS_WRITE   equ 0x4 ; Operacao de Escrita
;     SYS_EXIT    equ 0x1 ; Codigo de chamada para finalizar

;     ;rbx -------Registrador que usa estas instruções
;     STD_IN      equ 0x0 ; Entrada padrao
;     STD_OUT     equ 0x1 ; Saida padrao
;     RET_EXIT    equ 0x0 ; Operacao realizada com Sucesso

section .bss    ;secção variáveis
    result: resb 1    ;reserva espaço na memoria
    tam0: equ $ - result ; $ - endereço final menos 'result' endereço inicial(equ - pseudoinstrução)

section  .data
    nline: db 0xA,0     ;(db - pseudoinstrução - define uma cadeia de bytes)
    tam1: equ $ - nline
    

section .text   ;aqui começa a programação
    global _start   ;label do ponto de entrada do programa - global é uma diretiva do compilador
                    ;especifica o ponto de entrada do programa
_start:

;carrega o valor 41h(65d) no registrador rax
    mov rax, 0x41
    mov [result], rax       ;tranfere o valor em rax para o endereço reservado em 'result'
    int 0x80                ;executa as operações anteriores
;operação de mostrar o caracter ascii 41h (A)
    mov rax, 0x4            ;ativa operação de saída
    mov rbx, 0x1            ;para a saída padrão
    mov rcx, result         ;exibe a mensagem ao usuário - imprimi o que está no endereço ?
    mov rdx, tam0           ;diz qual o tamanho do dado no endereço 'result'
    int 0x80                ;passa o comando para o SO

;operação de line feed 
    mov rax, 0x4            ;ativa operação de saída
    mov rbx, 0x1            ;para a saída padrão
    mov rcx, nline          ;exibe a mensagem ao usuário - imprimi o que está no endereço ?
    mov rdx, tam1           ;diz qual o tamanho do dado no endereço 'nline'
    int 0x80                ;passa o comando para o SO
                            ;int 0x80 é uma maneira herdada de chamar uma chamada do sistema
                            ;e deve ser evitada.
saida:
    ;instruções obrigatórias para encerrar qualquer programa nasm
    mov     rax,0x3c         ;indica o final de operação, corresponde a System.exit
    mov     rdi,0x0         ;informa o estado final do programa - 0 sem erro
    syscall                 
                            ;syscall é a maneira padrão de entrar no modo kernel em x86-64.
                            ;Esta instrução não está disponível nos modos de operação de 32
                            ;bits nos processadores Intel.
                            ;sysenter é uma instrução usada com mais freqüência para chamar
                            ;chamadas do sistema nos modos de operação de 32 bits.
                            ;É semelhante a syscall, porém um pouco mais difícil de usar,
                            ;mas essa é a preocupação do kernel. Para usar syscal tem que
                            ;fazer 'mov rax,60' para evitar "segmentation fall"