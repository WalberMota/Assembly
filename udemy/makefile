# saida com 0x80
NAME=saida_syscall

all: $(NAME).o
	ld $(NAME).o 
	@rm *.o

%.o: %.asm
	nasm -f elf64 $<