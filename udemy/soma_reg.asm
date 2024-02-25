
section. data
    num1 dd	0xFF
    num2 dd	0xAA
    ans dd	0x0
    tam  equ $ - ans
        
    nline db 0xA,0     ;(db - pseudoinstrução - define uma cadeia de bytes)
    tam1 equ $ - nline
section .text
    global _start
_start :
;carrega o valor 41h(65d) no registrador eax
    mov eax, num1
    add eax, num2
    mov ans, eax

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, ans
    mov edx, tam           ;diz qual o tamanho do dado no endereço 'result'
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