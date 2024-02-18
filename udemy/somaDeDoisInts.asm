; ;.386
; ;.model flat,stdcall
; ;.stack 4096
; ;.code
; ;main Proc
;     mov eax, 10000h
;     add eax, 40000h
;     sub eax, 20000h
;     int 0x80  
;     ret
; ;main ENDP
; ;END main


    mov eax, 10000h
    add eax, 40000h
    sub eax, 20000h
    int 0x80  
    ret