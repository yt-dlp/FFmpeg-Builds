#!/bin/bash

SCRIPT_REPO="https://git.savannah.gnu.org/git/libiconv.git"
SCRIPT_MIRROR="git://git.git.savannah.gnu.org/libiconv.git"
SCRIPT_COMMIT="baaba39736e3b498e1597bf0e5e899b1f753fb01"

SCRIPT_REPO2="https://git.savannah.gnu.org/git/gnulib.git"
SCRIPT_MIRROR2="https://github.com/coreutils/gnulib.git"
SCRIPT_COMMIT2="f9e4c24e9bf3f878a11505a8d06bec965f0fca02"

ffbuild_enabled() {
    return 0
}

ffbuild_dockerdl() {
    echo "retry-tool sh -c \"rm -rf iconv && git clone '$SCRIPT_MIRROR' iconv\" && git -C iconv checkout \"$SCRIPT_COMMIT\""
    echo "cd iconv && retry-tool sh -c \"rm -rf gnulib && git clone --filter=blob:none '$SCRIPT_MIRROR2' gnulib\" && git -C gnulib checkout \"$SCRIPT_COMMIT2\" && rm -rf gnulib/.git"
}

ffbuild_dockerbuild() {
    (unset CC CFLAGS GMAKE && ./autogen.sh)

    local myconf=(
        --prefix="$FFBUILD_PREFIX"
        --enable-extra-encodings
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

ffbuild_configure() {
    echo --enable-iconv
}

ffbuild_unconfigure() {
    echo --disable-iconv
}
