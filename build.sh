#!/bin/sh

if [ -z "$CHROOT" ]; then
export PKG_CMD="makechrootpkg -c -r $CHROOT --"
else
export PKG_CMD="makepkg"
fi

./build-archive.sh "$@"

cd n64graphics
$PKG_CMD -Cfs "$@"

cd ../qemu-irix
$PKG_CMD --noconfirm -Cfsi "$@"

cd ../mips-n64-binutils
$PKG_CMD --noconfirm -Cfsi "$@"

cd ../mips-n64-gcc-stage1
if [ -z "$CHROOT" ]; then
makechrootpkg -c -r $CHROOT -I "../mips-n64-binutils/mips-n64-binutils-*.pkg.tar.zst" -- --noconfirm -Cfsi "$@"
else
$PKG_CMD --noconfirm -Cfsi "$@"
fi

cd ../mips-n64-newlib
if [ -z "$CHROOT" ]; then
makechrootpkg -c -r $CHROOT -I "../mips-n64-gcc-stage1/mips-n64-gcc-stage1-*.pkg.tar.zst" -- --noconfirm -Cfsi "$@"
else
$PKG_CMD --noconfirm -Cfsi "$@"
fi

cd ../mips-n64-gcc
if [ -z "$CHROOT" ]; then
makechrootpkg -c -r $CHROOT -I "../mips-n64-binutils/mips-n64-binutils-*.pkg.tar.zst" -- --noconfirm -Cfsi "$@"
else
$PKG_CMD --noconfirm -Cfsi "$@"
fi

cd ../root-compatibility-environment
$PKG_CMD -Cf "$@"

cd ../vadpcm-tools
if [ -z "$CHROOT" ]; then
makechrootpkg -c -r $CHROOT -I "../qemu-irix/qemu-irix-*.pkg.tar.zst" -- --noconfirm -Cfsi "$@"
else
$PKG_CMD --noconfirm -Cfsi "$@"
fi

cd ../libstdc++296
$PKG_CMD -Cfs "$@"

cd ../spicy
$PKG_CMD -Cfs "$@"

cd ../makemask
$PKG_CMD -Cfs "$@"

cd ../rspcode-src
$PKG_CMD -Cfd "$@"
