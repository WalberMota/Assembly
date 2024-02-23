NAME=continua

all: $(NAME).o
	ld -o output $(NAME).o 
	@rm *.o

%.o: %.asm
	nasm -g -f elf64 $<