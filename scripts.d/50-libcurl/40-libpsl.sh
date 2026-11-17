#!/bin/bash

SCRIPT_REPO="https://github.com/rockdaboot/libpsl.git"
SCRIPT_COMMIT="88331dae18f1824ab033f7e77880cf65814fc21a"

SCRIPT_REPO2="https://github.com/publicsuffix/list.git"
SCRIPT_COMMIT2="ee4f2faaca9387a7cf3d433e68484b82c9542543"

ffbuild_enabled() {
    return 0
}

ffbuild_dockerdl() {
    default_dl .
    echo "git-mini-clone \"$SCRIPT_REPO2\" \"$SCRIPT_COMMIT2\" list"
}

ffbuild_dockerbuild() {
    mkdir build && cd build

    local myconf=(
        --prefix="$FFBUILD_PREFIX"
        --buildtype=release
        --default-library=static
        -Druntime=no
        -Dbuiltin=true
        -Dtests=false
        -Ddocs=false
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
