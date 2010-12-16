uzd: uzd.o
	ld -o uzd uzd.o

uzd.o: uzd.fasm ../../include/common.fasm ../../include/syscalls.fasm ../../include/system.fasm ../../../include/copy.fasm ../../../include/cstring.fasm
	fasm uzd.fasm

clean:
	rm -f uzd.o uzd *.core ktrace.out

objdump: uzd
	objdump -d -M intel uzd

ktrace: uzd
	ktrace ./uzd
	kdump
