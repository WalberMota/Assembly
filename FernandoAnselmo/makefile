NOME = entrada

all: $(NOME).o
	ld -s -o output $(NOME).o
	rm -rf *.o;

%.o: %.asm
	nasm -f elf64 $<