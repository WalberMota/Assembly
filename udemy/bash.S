
.text:
mov    $0x41,%eax
mov    %eax,0x402000
int    $0x80
mov    $0x4,%eax
mov    $0x1,%ebx
mov    $0x402000,%ecx
mov    $0x1,%edx
int    $0x80
mov    0x402000,%eax
add    $0x1,%eax
cmp    $0x43,%eax
jle    0x401005
mov    $0x1,%eax
mov    $0x0,%ebx
int    $0x80

#Disassembly of section .bss:

.bss:
add    %al,(%rax)
add    %al,(%rax)
add    %al,(%rax)
add    %al,(%rax)
