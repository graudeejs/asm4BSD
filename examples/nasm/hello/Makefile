build: hello

hello.o: hello.nasm
	nasm -f elf -o hello.o hello.nasm

hello: hello.o
	ld -s -o hello hello.o

clean:
	rm -f *.o hello *.core
