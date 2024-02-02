NOME = hello
# linkador
all: $(NOME).o
	ld -s -o output $(NOME).o
	rm -rf *.o;

# o $< é o mesmo que $(source_file).asm ------- regex ???
%.o: %.asm
#	nasm -f elf64 $(NOME).asm
	nasm -f elf64 $<
# podia fazer também:  nasm -f elf64 $(NOME).asm, ao invés de expressão regular