NAME=$(continua)

all: $(NAME).o
	ld -o output $(NAME).o
	@rm *.o

%.o: %.asm
	@rm $(NAME)
	nasm -g -f elf64 $<