#!/bin/bash

SCRIPT_REPO="https://github.com/adah1972/libunibreak.git"
SCRIPT_COMMIT="ff24f284a567a006c183b3507b6c650d6ec68b94"

ffbuild_enabled() {
    return 0
}

ffbuild_dockerbuild() {
    bash ./bootstrap

    local myconf=(
        --prefix="$FFBUILD_PREFIX"
        --disable-shared
        --enable-static
        --with-pic
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
    make install DESTDIR="$FFBUILD_DESTDIR"
}
