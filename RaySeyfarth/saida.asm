;Program : saida.asm
;executa uma saida na chamada do sistema
;Sem entradas (inputs)
;saida : apenas a saida no status use ($? no shell)


segment .text

global _start

_start :
        mov eax,1 ;1 é o número de chamada do sistema de saída
        mov ebx,3 ;o valor do status a ser retornado - se mudar aqui muda em "echo $?"
        int 0x80  ;executar uma chamada de sistema


