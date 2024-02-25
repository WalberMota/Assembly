NAME=soma_reg

all: $(NAME).o
	# ld $(NAME).o 
	ld -m elf_i386 -s $(NAME).o
	@rm *.o

%.o: %.asm
	nasm -f elf32 $<