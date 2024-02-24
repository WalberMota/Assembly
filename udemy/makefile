# saida com 0x80
NAME=saida_0x80

all: $(NAME).o
	ld $(NAME).o 
	@rm *.o

%.o: %.asm
	nasm -g -f elf64 $<