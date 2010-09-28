fasm2nasm:
	sed -f fasm2nasm.sed FreeBSD.fasm > FreeBSD.nasm

nasm2fasm:
	sed -f nasm2fasm.sed FreeBSD.nasm > FreeBSD.fasm
