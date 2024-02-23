NAME=saida_syscall

all: $(NAME).o
	ld $(NAME).o 
	@rm *.o

%.o: %.asm
	nasm -g -f elf64 $<