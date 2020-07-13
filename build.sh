#!/bin/bash

set -eu
export PS4='> '
set -x
mkdir dist/
cd libgnurx-2.5
make
#sudo cp regex.h /usr/x86_64-w64-mingw32/include/
#sudo cp libregex.a /usr/x86_64-w64-mingw32/lib/
#sudo cp libgnurx.dll.a /usr/x86_64-w64-mingw32/lib/
export LDFLAGS="-L$PWD"
export CFLAGS="-I$PWD"
cp COPYING.LIB ../dist/COPYING.libgnurx
cp libgnurx-0.dll ../dist/
cd ../file/
autoreconf -f -i
./configure --disable-silent-rules --enable-fsect-man5
make -j4
cp magic/magic.mgc ../dist/
make clean
./configure --disable-silent-rules --enable-fsect-man5 --host=x86_64-w64-mingw32
make -j4
cp src/.libs/libmagic-1.dll ../dist/
cp src/.libs/file.exe ../dist/
cp COPYING ../dist/COPYING.file
