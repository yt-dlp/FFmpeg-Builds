#!/bin/bash

# https://www.freetype.org/download.html
FREETYPE_SRC="https://download.savannah.gnu.org/releases/freetype/freetype-2.11.0.tar.xz"

ffbuild_enabled() {
    return 0
}

ffbuild_dockerbuild() {
    mkdir ft
    cd ft
    wget -O ft.tar.gz "$FREETYPE_SRC"
    tar xaf ft.tar.gz
    rm ft.tar.gz
    cd freetype*

    local myconf=(
        --prefix="$FFBUILD_PREFIX"
        --disable-shared
        --enable-static
    )

    if [[ $TARGET == win* || $TARGET == linux* ]]; then
        myconf+=(
            --host="$FFBUILD_TOOLCHAIN"
        )
    else
        echo "Unknown target"
        return -1
    fi

    ./configure "${myconf[@]}"
    make -j$(nproc)
    make install
}

ffbuild_configure() {
    echo --enable-libfreetype
}

ffbuild_unconfigure() {
    echo --disable-libfreetype
}
