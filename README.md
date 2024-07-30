# n64sdk-pkgbuilds
This repo contains various PKGBUILDs for CrashOveride95's [Modern N64 SDK](https://crashoveride95.github.io/n64hbrew/modernsdk/index.html) for use on Arch-based Linux distributions.

## Setup
It is highly recommended that you check the main [Getting Started](https://crashoveride95.github.io/n64hbrew/modernsdk/startoff.html) guide as it contains some things that are essential to getting this working, e.g. setting up paths and variables.

A pacman repository containing these packages is available. To use it, add my PGP key first:
```sh
# pacman-key --keyserver keyserver.ubuntu.com --recv-keys 7D497397CC3A2A8C
# pacman-key --lsign-key 7D497397CC3A2A8C
```

Then add the repo to your `/etc/pacman.conf`:
```
[n64sdk]
Server = https://repo.projectlounge.pw/pacman/n64sdk/
```

And finally, update your package database:
```sh
# pacman -Sy
```

For most of these packages, you should be able to build them using `makepkg` and/or the provided build scripts. However, the archive-pkgs directory requires that you run `build-archive.sh`.

## Differences
Due to the packaging systems, practices, and philosophies differing between Debian and Arch, there are some differences between the original Modern N64 SDK and this repo:
- The `makemask`, `mips-n64-binutils`, `mips-n64-newlib`, `mips-n64-gcc`, `n64graphics`, `qemu-irix`, `spicy`, `vadpcm-tools`, and `libcart` packages are all rebuilt from source
- The `unfloader` package is based on version 2.2 instead of 2.1, due to 2.2 using libftdi (which is packaged in the official Arch repos)
- `libstdc++296` is used instead of `libstdc++2.10-glibc2.2`
- The `spicy` package uses my own branch that simply specifies the needed build dependencies
