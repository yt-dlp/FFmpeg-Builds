#!/bin/bash

SCRIPT_REPO="https://gitlab.freedesktop.org/pixman/pixman.git"
SCRIPT_COMMIT="b88b92e512a33a222e08352e87ff90a57d33c7b5"

ffbuild_enabled() {
    return 0
}

ffbuild_dockerbuild() {
    mkdir build && cd build

    local myconf=(
        --prefix="$FFBUILD_PREFIX"
        --buildtype=release
        --default-library=static
        -Dgtk=disabled
        -Dlibpng=disabled
        -Dopenmp=disabled
        -Dtests=disabled
        -Ddemos=disabled
    )

    if [[ $TARGET == win* || $TARGET == linux* ]]; then
        myconf+=(
            --cross-file=/cross.meson
        )
    else
        echo "Unknown target"
        return -1
    fi

    meson setup "${myconf[@]}" ..
    ninja -j$(nproc)
    DESTDIR="$FFBUILD_DESTDIR" ninja install
}
