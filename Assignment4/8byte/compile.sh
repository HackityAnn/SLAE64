#!/bin/sh
nasm -f elf64 decoder.nasm
ld decoder.o -o decoder
