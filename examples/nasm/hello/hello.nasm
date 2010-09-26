%include "../../../FreeBSD.nasm"

section .text
	global _start
_start:
	push	msg_len
	push	msg
	push	STDOUT
	mov	eax,SYS_WRITE
	push	eax
	int	0x80
	add	esp,4*3		; clear stack after interupt

	push	EXIT_SUCCESS
	mov	eax,SYS_EXIT
	int	0x80

section .data
msg		db	"Hello World", 0xA
msg_len		equ	$-msg

; vim: set ts=8 sw=8 syntax=nasm:
