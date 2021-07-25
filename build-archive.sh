#!/bin/sh

cd archive-pkgs

export PKG_VER=2.0L
export PKG_ARCH=any
export PKG_BASEDIR=usr

export PKG_NAME=n64sdk-common
export PKG_DESC="Include files used in both N64 SDK libraries"
makepkg -f

export PKG_NAME=n64sdk
export PKG_DESC="N64 SDK libraries and include files"
export PKG_DEPENDS='n64sdk-common'
export PKG_CONFLICTS='iquesdk'
export PKG_PROVIDES='n64-buildenv'
makepkg -fd

export PKG_NAME=iquesdk
export PKG_DESC="iQue SDK libraries and include files"
export PKG_CONFLICTS='n64sdk'
makepkg -fd

export PKG_DEPENDS=
export PKG_CONFLICTS=
export PKG_PROVIDES=

export PKG_NAME=libnaudio
export PKG_DESC="Nintendo's main N64 sound library, a.k.a. SGI Audio"
makepkg -f

export PKG_NAME=u64assets
export PKG_DESC="Sound assets from the N64 SDK"
makepkg -f

export PKG_NAME=libnustd
export PKG_DESC="Nintendo's implementation of the standard C libraries"
export PKG_VER=1.3.3
makepkg -f

export PKG_NAME=libhvq
export PKG_DESC="Image decompression library by Hudson and Nintendo"
export PKG_VER=1.2.0
makepkg -f

export PKG_NAME=libhvqm
export PKG_DESC="FMV decompression library by Hudson and Nintendo"
makepkg -f

export PKG_NAME=n64-demos
export PKG_DESC="Various N64 SDK demos"
export PKG_VER=2.0L
export PKG_DEPENDS="n64-buildenv libnaudio u64assets libnustd"
export PKG_SUGGESTS="libhvqm"
makepkg -fd

export PKG_DEPENDS=
export PKG_SUGGESTS=

export PKG_NAME=libnusys
export PKG_DESC="NuSystem, a library designed to help newcomers understand the N64's architecture"
export PKG_VER=2.0.7
makepkg -f

export PKG_NAME=libmus
export PKG_DESC="N64 sound library by Software Creations, a.k.a. N64 SoundTools"
export PKG_VER=3.1.4
makepkg -f

export PKG_NAME=mus-demos
export PKG_DESC="Various libmus demos"
export PKG_DEPENDS="n64-buildenv libnaudio u64assets libnustd libmus"
makepkg -fd

export PKG_NAME=nusys-demos
export PKG_DESC="Various NuSystem demos"
export PKG_VER=2.0.9
export PKG_DEPENDS="n64-buildenv libnsys libmus libnaudio libnustd"
makepkg -fd

export PKG_DEPENDS=

export PKG_NAME=tutorial-demos
export PKG_DESC="N64 SDK tutorial demos"
export PKG_VER=2.0L
makepkg -f

export PKG_NAME=n64manual
export PKG_DESC="N64 SDK HTML manual"
makepkg -f

export PKG_NAME=n64-conv-tools
export PKG_DESC="Various N64 conversion tools"
export PKG_VER=1.0.7
export PKG_ARCH=i686
export PKG_BASEDIR=etc
export PKG_DEPENDS="netpbm tcsh root-compatibility-environment"
export PKG_PROVIDES="imscale flt2c rgb2c ppmquant_n64 cglue cscale imgsize imscale subimg"
CARCH="i686" linux32 makepkg -fd

export PKG_NAME=rsp-tools
export PKG_DESC="N64 RSP assembler and tools"
export PKG_VER=2.4.4
export PKG_DEPENDS="libstdc++296 root-compatibility-environment"
export PKG_PROVIDES="imscale flt2c rgb2c ppmquant_n64 cglue cscale imgsize imscale subimg"
CARCH="i686" linux32 makepkg -fd
