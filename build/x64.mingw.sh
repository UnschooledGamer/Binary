# Install dependency
pacman -S --noconfirm --needed autoconf automake libtool pkgconf mingw-w64-x86_64-gcc mingw-w64-x86_64-pkg-config make

# Make directory
mkdir -p ./bin

# Build sodium
cd ./libsodium
if [ -e "./libsodium-win64/bin/libsodium-26.dll" ]; then
  echo "[LunaStream Builder]: Copy sodium binary"
  cp ./libsodium-win64/bin/libsodium-26.dll ../bin/sodium-win32-x64.dll
else
  echo "[LunaStream Builder]: Build sodium binary"
  ./autogen.sh
  ./configure --host=x86_64-w64-mingw32 --prefix=/mingw64 --disable-static --enable-shared &&
    make clean &&
    make &&
    make check &&
    make install
  cp ./libsodium-win64/bin/libsodium-26.dll ../bin/sodium-win32-x64.dll
fi
cd ..

# Build opus
cd libopus
if [ -e "./.libs/libopus-0.dll" ]; then
  echo "[LunaStream Builder]: Copy opus binary"
  cp ./.libs/libopus-0.dll ../bin/opus-win32-x64.dll
else
  echo "[LunaStream Builder]: Build opus binary"
  ./autogen.sh
  ./configure --host=x86_64-w64-mingw32 --prefix=/mingw64 --disable-static --enable-shared &&
    make clean &&
    make &&
    make check &&
    make install
  cp ./.libs/libopus-0.dll ../bin/opus-win32-x64.dll
fi
cd ..

# Build vorbis
cd libvorbis
if [ -e "./lib/.libs/libvorbis-0.dll" ]; then
  echo "[LunaStream Builder]: Copy vorbis binary"
  cp ./lib/.libs/libvorbis-0.dll ../bin/vorbis-win32-x64.dll
else
  echo "[LunaStream Builder]: Build vorbis binary"
  ./autogen.sh
  ./configure --host=x86_64-w64-mingw32 --prefix=/mingw64 --disable-static --enable-shared &&
  make
  cp ./lib/.libs/libvorbis-0.dll ../bin/vorbis-win32-x64.dll
fi
cd ..

# Build fdk-aac
cd libfdkaac
if [ -e "./.libs/libfdk-aac-2.dll" ]; then
  echo "[LunaStream Builder]: Copy fdk-aac binary"
  cp ./.libs/libfdk-aac-2.dll ../bin/fdk-aac-win32-x64.dll
else
  echo "[LunaStream Builder]: Build fdk-aac binary"
  ./autogen.sh
  ./configure --host=x86_64-w64-mingw32 --prefix=/mingw64 --disable-static --enable-shared &&
  make
  cp ./.libs/libfdk-aac-2.dll ../bin/fdk-aac-win32-x64.dll
  cd ..
fi