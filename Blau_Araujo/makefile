NAME=salve

all: $(NAME).o
	ld $(NAME).o 
	@rm *.o

%.o: %.asm
	nasm -f elf64 $<