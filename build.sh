#!/bin/bash
cd libgnurx-2.5
make
sudo cp regex.h /usr/x86_64-w64-mingw32/include/
sudo cp libregex.a /usr/x86_64-w64-mingw32/lib/
sudo cp libgnurx.dll.a /usr/x86_64-w64-mingw32/lib/
cd ../file/
autoreconf -f -i
./configure --disable-silent-rules --enable-fsect-man5 --host=x86_64-w64-mingw32
make -j4
