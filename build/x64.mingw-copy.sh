# Install dependency
pacman -S --noconfirm --needed autoconf automake libtool pkgconf mingw-w64-i686-gcc mingw-w64-i686-pkg-config make cmake mingw-w64-i686-libogg tree

# Make directory
mkdir bin

# Build sodium
cd ./libsodium
echo "[LunaStream Builder]: Build sodium binary"
./autogen.sh
./configure --host=i686-w64-mingw32 --prefix=/mingw32 --disable-static --enable-shared &&
make
make install
cp ./mingw32/bin/libsodium-26.dll ../bin/sodium-win32-x86.dll
tree .
cd ..

echo "/mingw32 files"
ls -al /mingw32 
