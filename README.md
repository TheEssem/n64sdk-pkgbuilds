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
