#!/bin/bash

SCRIPT_REPO="https://github.com/AcademySoftwareFoundation/openapv.git"
SCRIPT_COMMIT="3f0291391dbb1fbc27229b2543aad4ce778b0d72"

ffbuild_enabled() {
    (( $(ffbuild_ffver) > 701 )) || return -1
    return 0
}

ffbuild_dockerdl() {
    default_dl .
    echo "git fetch --unshallow --filter=blob:none"
}

ffbuild_dockerbuild() {
    mkdir build && cd build

    if [[ $TARGET == *32 ]]; then
        export CFLAGS="$CFLAGS -msse -msse2"
        export CXXFLAGS="$CXXFLAGS -msse -msse2"
    fi

    cmake -DCMAKE_TOOLCHAIN_FILE="$FFBUILD_CMAKE_TOOLCHAIN" -DCMAKE_INSTALL_PREFIX="$FFBUILD_PREFIX" -DCMAKE_BUILD_TYPE=Release \
        -DOAPV_BUILD_SHARED_LIB=OFF -DOAPV_BUILD_APPS=OFF -DENABLE_TESTS=OFF ..

    make -j$(nproc)
    make install DESTDIR="$FFBUILD_DESTDIR"

    rm -rf "$FFBUILD_DESTPREFIX"/{bin,lib/oapv,lib/import,include/oapv/oapv_exports.h,lib/liboapv.so*}
}

ffbuild_configure() {
    echo --enable-liboapv
}

ffbuild_unconfigure() {
    (( $(ffbuild_ffver) > 701 )) || return 0
    echo --disable-liboapv
}
