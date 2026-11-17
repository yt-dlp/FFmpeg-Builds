#!/bin/bash

SCRIPT_REPO="https://github.com/nghttp2/nghttp2.git"
SCRIPT_COMMIT="c785bf23f9d77966085ae1b32717f3e8c8d12090"

ffbuild_enabled() {
    return 0
}

ffbuild_dockerbuild() {
    mkdir build && cd build

    cmake -GNinja -DCMAKE_TOOLCHAIN_FILE="$FFBUILD_CMAKE_TOOLCHAIN" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$FFBUILD_PREFIX" \
        -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON -DENABLE_LIB_ONLY=ON -DENABLE_DOC=OFF -DBUILD_TESTING=OFF ..
    ninja -j$(nproc)
    DESTDIR="$FFBUILD_DESTDIR" ninja install

    echo "Cflags.private: -DNGHTTP2_STATICLIB" >> "$FFBUILD_DESTPREFIX"/lib/pkgconfig/libnghttp2.pc
}
