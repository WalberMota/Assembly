NAME=continua

all: $(NAME).o
	ld -o output $(NAME).o 
	@rm *.o

%.o: %.asm
	# @rm output - se não existir o programa dá um erro e não continua
	nasm -g -f elf64 $<