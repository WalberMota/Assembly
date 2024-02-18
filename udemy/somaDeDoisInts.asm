.386
.model flat,stdcall
.stack 4096
.code
main Proc
    mov eax, 10000h
    add eax, 40000h
    sub eax, 20000h
    ret
main ENDP
END main


