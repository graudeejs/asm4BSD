build: hello

hello.o: hello.fasm
	fasm hello.fasm hello.o

hello: hello.o
	ld -s -o hello hello.o

clean:
	rm -f *.o hello *.core ktrace.out

ktrace: hello
	ktrace ./hello
	kdump
