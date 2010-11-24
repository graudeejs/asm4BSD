build: sndrecplay

sndrecplay.o: sndrecplay.fasm
	fasm sndrecplay.fasm sndrecplay.o

sndrecplay: sndrecplay.o
	ld -s -o sndrecplay sndrecplay.o

clean:
	rm -f *.o sndrecplay *.core ktrace.out

ktrace: sndrecplay
	ktrace ./sndrecplay
	kdump
