build: echo_cmdl

echo_cmdl.o: echo_cmdl.fasm
	fasm echo_cmdl.fasm echo_cmdl.o

echo_cmdl: echo_cmdl.o
	ld -o echo_cmdl echo_cmdl.o

clean:
	rm -f *.o echo_cmdl *.core ktrace.out

ktrace: echo_cmdl
	ktrace ./echo_cmdl
	kdump
