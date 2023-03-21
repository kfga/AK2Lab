all: hello writeText compareText

hello.o: hello.s
	as --32 $< -o $@

hello: hello.o
	ld -m elf_i386 $< -o $@

writeText.o: writeText.s
	as --32 $< -o $@

writeText: writeText.o
	ld -m elf_i386 $< -o $@

compareText.o: compareText.s
	as --32 $< -o $@

compareText: compareText.o
	ld -m elf_i386 $< -o $@

clean:
	rm -f hello.o hello writeText.o writeText compareText.o compareText
