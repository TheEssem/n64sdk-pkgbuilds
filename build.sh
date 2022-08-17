#!/bin/sh

./build-archive.sh "$@"

cd n64graphics
makepkg -Cfs "$@"

cd ../qemu-irix
makepkg --noconfirm -Cfsi "$@"

cd ../mips-n64-binutils
makepkg --noconfirm -Cfsi "$@"

cd ../mips-n64-gcc-stage1
makepkg --noconfirm -Cfsi "$@"

cd ../mips-n64-newlib
makepkg --noconfirm -Cfsi "$@"

cd ../mips-n64-gcc
makepkg --noconfirm -Cfsi "$@"

cd ../root-compatibility-environment
makepkg -Cf "$@"

cd ../vadpcm-tools
makepkg --noconfirm -Cfsi "$@"

cd ../libstdc++296
makepkg -Cfs "$@"

cd ../spicy
makepkg -Cfs "$@"

cd ../makemask
makepkg -Cfs "$@"

cd ../rspcode-src
makepkg -Cfd "$@"
