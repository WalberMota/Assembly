section. data
        num1	dword	11111111h
        num2	dword	10101010h

segment .text

global _start
_start :
        mov	eax,num1
		add eax,num2
		mov	ans,eax    


        mov eax,0x1
        mov ebx,0x0 
        int 0x80  ;executar uma chamada de sistema