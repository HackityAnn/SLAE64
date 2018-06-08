    section .text
        global _start
 
    _start:
	push dword 0x4321fedc
	pop rdx
	push dword 0x28121969
	pop rsi
	mov edi, 0xfee1dead
	add al, 0xa9
        syscall
