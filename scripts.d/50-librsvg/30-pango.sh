#!/bin/bash

SCRIPT_REPO="https://github.com/GNOME/pango.git"
SCRIPT_COMMIT="6bd640fdbdfe4d751cc17e0fff25caa6a372d303"

ffbuild_depends() {
    echo base
    echo fribidi
    echo fonts
}

ffbuild_enabled() {
    return 0
}

ffbuild_dockerbuild() {
    # Fixes Werror failure on clang
    sed -i "/^\s*'-Werror=unused-but-set-variable'.*$/d" meson.build

    mkdir build && cd build

    local myconf=(
        --prefix="$FFBUILD_PREFIX"
        --buildtype=release
        --default-library=static
        --wrap-mode=nodownload
        -Dcairo=enabled
        -Dfreetype=enabled
        -Dfontconfig=enabled
        -Dlibthai=disabled
        -Dxft=disabled
        -Dsysprof=disabled
        -Dintrospection=disabled
        -Ddocumentation=false
        -Dman-pages=false
        -Dgtk_doc=false
        -Dbuild-testsuite=false
        -Dbuild-examples=false
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
