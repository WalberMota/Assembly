section. data
    num1 dd	5
    num2 dd	3
      
    nline db 0xA,0     ;(db - pseudoinstrução - define uma cadeia de bytes)
    tam1 equ $ - nline

section .bss
    result resd 1
    tam2 equ $ - result
section .text
    global _start
_start :
;carrega o valor 41h(65d) no registrador eax
    mov eax, [num1]
    add eax, [num2]
    mov ans, eax
    int 0x80

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, result
    mov edx, tam2           ;diz qual o tamanho do dado no endereço 'result'
    int 0x80                ;passa o comando para o SO

;operação de line feed 
    mov eax, 0x4            ;ativa operação de saída
    mov ebx, 0x1            ;para a saída padrão
    mov ecx, nline          ;exibe a mensagem ao usuário - imprimi o que está no endereço ?
    mov edx, tam1           ;diz qual o tamanho do dado no endereço 'nline'
    int 0x80                ;passa o comando para o SO        

    mov eax,0x1
    mov ebx,0x0 
    int 0x80  ;executar uma chamada de sistema