#!/bin/bash

# This file is meant to be included by the parent cppbuild.sh script
if [[ -z "$PLATFORM" ]]; then
    pushd ..
    bash cppbuild.sh "$@" dlib
    popd
    exit
fi

set -euo pipefail

export DLIB_VERSION="19.16"
export OPENCV_VERSION="4.0.1"

export SUCCEEDED=0
export FAILED=1
export IGNORED=2


# http://dlib.net/compile.html
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=dlib
# https://www.learnopencv.com/install-dlib-on-ubuntu/
dlib::install_library()
{
    declare library_folder_path="."

    info "Configuring CMake"
    pushd "${library_folder_path}/dlib"
    mkdir -p "./build"
    pushd "./build"
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH="${library_folder_path}/usr" \
        -DCMAKE_INSTALL_LIBDIR:PATH="${library_folder_path}/usr/lib" \
        -DBUILD_SHARED_LIBS:BOOL=ON \
        -DUSE_AVX_INSTRUCTIONS:BOOL=ON \
        -DUSE_SSE2_INSTRUCTIONS:BOOL=ON \
        -DUSE_SSE4_INSTRUCTIONS:BOOL=ON \
        -DCMAKE_BUILD_TYPE="Release" \
        ".."
    popd
    popd

    info "Compiling"
    pushd "${library_folder_path}/dlib/build"
    make
    popd

    info "Installing"
    pushd "${library_folder_path}/dlib/build"
    make install
    popd
}



download http://dlib.net/files/dlib-${DLIB_VERSION}.zip dlib-$DLIB_VERSION.zip
mkdir -p $PLATFORM
cd $PLATFORM
unzip ../dlib-$DLIB_VERSION.zip
cd dlib-$DLIB_VERSION

case $PLATFORM in
    linux-x86)
        dlib::install_library
        ;;
    linux-x86_64)
        dlib::install_library
        ;;
    *)
        echo "Error: Platform \"$PLATFORM\" is not supported"
        ;;
esac

cd ../..
