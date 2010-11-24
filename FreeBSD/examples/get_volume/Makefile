build: get_volume get_volume_libc

get_volume.o: get_volume.fasm
	fasm get_volume.fasm get_volume.o

get_volume: get_volume.o
	ld -s -o get_volume get_volume.o

clean:
	rm -f *.o get_volume *.core ktrace.out
	rm -f *.o get_volume_libc *.core ktrace.out

ktrace: get_volume
	ktrace ./get_volume
	kdump


get_volume_libc.o: get_volume_libc.fasm
	fasm get_volume_libc.fasm get_volume_libc.o

get_volume_libc: get_volume_libc.o
	#ld -s -lc --export-dynamic  get_volume_libc.o -o get_volume_libc
	${CC} get_volume_libc.o -o get_volume_libc


