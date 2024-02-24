;Program Description: Exibição de caracter ASCII na saida padrão
;Author: Waber Mota
;Creation date: 23/02/2024


section  .data
    nline db 0xA,0     ;(db - pseudoinstrução - define uma cadeia de bytes)
    tam1 equ $ - nline
    
section .bss    ;secção variáveis
    result resb 1    ;reserva espaço na memoria
    tam0 equ $ - result ; $ - endereço final menos 'result' endereço inicial(equ - pseudoinstrução)

section .text   ;aqui começa a programação
    global _start   ;label do ponto de entrada do programa - global é uma diretiva do compilador
                    ;especifica o ponto de entrada do programa
_start:

;carrega o valor 41h(65d) no registrador rax
    mov eax, 0x41
    mov [result], eax
    mov eax, 0x4            ;ativa operação de saída
    mov ebx, 0x1            ;para a saída padrão
    mov ecx, result         ;exibe a mensagem ao usuário - imprimi o que está no endereço ?
    mov edx, tam0           ;diz qual o tamanho do dado no endereço 'result'
    int 0x80

;operação de line feed 
    mov eax, 0x4            ;ativa operação de saída
    mov ebx, 0x1            ;para a saída padrão
    mov ecx, nline          ;exibe a mensagem ao usuário - imprimi o que está no endereço ?
    mov edx, tam1           ;diz qual o tamanho do dado no endereço 'nline'
    int 0x80                ;passa o comando para o SO
                            ;int 0x80 é uma maneira herdada de chamar uma chamada do sistema
                            ;e deve ser evitada?
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