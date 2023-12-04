NOME = entrada
# linkador
all: $(NOME).o
	ld -s -o output $(NOME).o
	rm -rf *.o;

# o $< é o mesmo que <source_file>.asm ------- regex ???
%.o: %.asm
	nasm -f elf64 $<