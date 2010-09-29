build: hello

hello.o: hello.nasm ../../../FreeBSD.nasm
	nasm -f elf -o hello.o hello.nasm

hello: hello.o
	ld -s -o hello hello.o

clean:
	rm -f *.o hello *.core ktrace.out

ktrace: hello
	ktrace ./hello
	kdump
