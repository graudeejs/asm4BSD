%include "../../../FreeBSD.nasm"

section .text
	global _start
_start:
	push	msg_len
	push	msg
	push	STDOUT
	push	eax		; dummy argument
	mov	eax,SYS_WRITE
	int	0x80
	add	esp,4*4		; clear stack after interupt

	push	EXIT_SUCCESS
	push	eax		; dummy arg
	mov	eax,SYS_EXIT
	int	0x80

section .data
msg		db	"Hello World", 0xA
msg_len		equ	$-msg

; vim: set ts=8 sw=8 syntax=nasm:
