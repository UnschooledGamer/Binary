# Install dependency
pacman -S --noconfirm --needed autoconf automake libtool pkgconf mingw-w64-i686-gcc mingw-w64-i686-pkg-config

# Make directory
mkdir -p ./bin

# Build sodium
cd ./libsodium
make clean
cd ..

# Build opus
cd libopus
make clean
cd ..

# Build vorbis
cd libvorbis
make clean
cd ..

# Build fdk-aac
cd libfdkaac
make clean
cd ..
