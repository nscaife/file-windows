# File and libmagic for Windows

This repository provides a process for building `file` and `libmagic` for Windows.  Currently, it only builds 64-bit versions.  Please feel free to contribute stylistic and usability changes via pull requests. 

Binaries are available on the Releases page for convenience, but if you need this, you should consider building it yourself.  

Prerequisites
-------

I have tested this on Bash for Windows (LXSS) under Windows 10 build 14393.  Since this is based on Ubuntu 14.04, I suspect this build will work in similar Ubuntu environments.  

You will need to install some packages before building:

    sudo apt-get update
    sudo apt-get install gcc-mingw-w64-i686 gcc-mingw-w64-x86-64 binutils-mingw-w64 git build-essential autoconf autoconf2.13 libtool

How to Build
-------

    git clone https://github.com/nscaife/file-windows.git
    cd file-windows
    git submodule init && git submodule update
    ./build.sh

The build process throws tons of warnings and errors since the Ubuntu environment cannot directly execute `file.exe` after building it.  Furthermore, `file` is built twice -- once to compile `magic.mgc` to avoid needing a Windows build step and second for the actual Windows build. I'd like to get rid of these errors (please submit pull requests!), but for now, the build is successful if the `dist/` directory contains the following four files:

    file.exe
    libgnurx-0.dll
    libmagic-1.dll
    magic.mgc

That's it! You can move this directory into your Windows environment.

Licensing
-------

 - `file/libmagic` has a license which allows its copying in both source and binary form, provided its license file accompanies it.  See file/COPYING for more information.
 - `libgnurx` is LGPL 2.1.
 - Everything else in the repository is public domain. Use it at your own risk.

Why?
-------

I needed a reproducible build of file and libmagic for Windows.  I ran into a number of issues:

 1. [File for Windows](http://gnuwin32.sourceforge.net/packages/file.htm) has not been updated since 2009.
 2. [File for Windows](http://gnuwin32.sourceforge.net/packages/file.htm) contains contains some additional GPL 2 and GPL 3 code (not Lesser GPL), effectively preventing its use in commercial software.
 3. Cygwin compiles require an additional runtime component be shipped alongside the executables.
 4. `mingw32` and `msys` distributions for Windows contain old or out-of-date packages, and I was not able to produce a working 64-bit build with these.
