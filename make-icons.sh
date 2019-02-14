#!/bin/bash

rm -r icons

for x in 16 22 24 32 48 64 128 256 ; do
    mkdir -p icons/${x}x${x}
    inkscape --export-png  icons/${x}x${x}/outlook.com.png -w ${x} -h ${x} outlook.com.svg
done
