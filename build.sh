#!/bin/sh
set -ex

if [ -n "$CHROOT" ]; then
export PKG_CMD="makechrootpkg -c -r $CHROOT --"
else
export PKG_CMD="makepkg"
fi

./build-archive.sh "$@"

cd n64graphics
$PKG_CMD -Cfs "$@"

cd ../qemu-irix
if [ -n "$CHROOT" ]; then
$PKG_CMD --noconfirm -Cfs "$@"
else
$PKG_CMD --noconfirm -Cfsi "$@"
fi

cd ../mips-n64-binutils
if [ -n "$CHROOT" ]; then
$PKG_CMD --noconfirm -Cfs "$@"
else
$PKG_CMD --noconfirm -Cfsi "$@"
fi

cd ../mips-n64-gcc-stage1
if [ -n "$CHROOT" ]; then
makechrootpkg -c -r $CHROOT -I ../mips-n64-binutils/mips-n64-binutils-*.pkg.tar.zst -- --noconfirm -Cfs "$@"
else
$PKG_CMD --noconfirm -Cfsi "$@"
fi

cd ../mips-n64-newlib
if [ -n "$CHROOT" ]; then
makechrootpkg -c -r $CHROOT -I ../mips-n64-gcc-stage1/mips-n64-gcc-stage1-*.pkg.tar.zst -I ../mips-n64-binutils/mips-n64-binutils-*.pkg.tar.zst -- --noconfirm -Cfs "$@"
else
$PKG_CMD --noconfirm -Cfsi "$@"
fi

cd ../mips-n64-gcc
if [ -n "$CHROOT" ]; then
makechrootpkg -c -r $CHROOT -I ../mips-n64-binutils/mips-n64-binutils-*.pkg.tar.zst -I ../mips-n64-gcc-stage1/mips-n64-gcc-stage1-*.pkg.tar.zst -I ../mips-n64-newlib/mips-n64-newlib-*.pkg.tar.zst -- --noconfirm -Cfs "$@"
else
$PKG_CMD --noconfirm -Cfsi "$@"
fi

cd ../root-compatibility-environment
$PKG_CMD -Cf "$@"

cd ../vadpcm-tools
if [ -n "$CHROOT" ]; then
makechrootpkg -c -r $CHROOT -I ../qemu-irix/qemu-irix-*.pkg.tar.zst -I ../archive-pkgs/n64-irix-env-*.pkg.tar.zst -- --noconfirm -Cfs "$@"
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

cd ../libcart
if [ -n "$CHROOT" ]; then
makechrootpkg -c -r $CHROOT -I ../mips-n64-gcc/mips-n64-gcc-*.pkg.tar.zst -I ../mips-n64-binutils/mips-n64-binutils-*.pkg.tar.zst -I ../mips-n64-newlib/mips-n64-newlib-*.pkg.tar.zst -I ../archive-pkgs/n64sdk-2.0L-*.pkg.tar.zst -I ../archive-pkgs/n64sdk-common-2.0L-*.pkg.tar.zst -- --noconfirm -Cfs "$@"
else
$PKG_CMD -Cfs "$@"
fi

cd ../unfloader
$PKG_CMD -Cfs "$@"
