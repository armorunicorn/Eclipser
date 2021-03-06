#!/bin/bash

# Grey-box concolic should find test cases that have \x51, \x72\x71, and
# \x41\x42\x43\x44.
gcc nested.c -o nested.bin -static -g || exit 1
rm -rf box
mkdir box
cd box
dotnet ../../build/Eclipser.dll fuzz -p ../nested.bin -t 20 -v 1 \
  --src auto --maxfilelen 16
