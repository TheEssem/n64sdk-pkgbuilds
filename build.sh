#!/bin/sh

./build-archive.sh "$@"

cd mips-n64-binutils
makepkg -fsi "$@"

cd ../mips-n64-gcc
makepkg -fs "$@"

cd ../root-compatibility-environment
makepkg -f "$@"

cd ../vadpcm-tools
makepkg -fs "$@"

cd ../spicy
makepkg -fs "$@"

cd ../makemask
makepkg -fs "$@"

cd ../n64graphics
makepkg -fs "$@"

cd ../rspcode-src
makepkg -fd "$@"

cd ../libstdc++296
makepkg -fs "$@"
