#!/bin/bash

set -x +e

mkdir -p $PREFIX/bin
mkdir -p $SRC_DIR/build

mkdir -p $PREFIX/include
mkdir -p $PREFIX/share/cmake
mkdir -p $PREFIX/share/doc
mkdir -p $PREFIX/share/pkgconfig

cd $SRC_DIR
# make CXX=$CXX CXXFLAGS="$CXXFLAGS" INSTALL_DIR=$PREFIX BUILD_ARCH=$ARCH HOST_ARCH=$ARCH prod
# cat $SRC_DIR/CMakeFiles/CMakeOutput.log 1>&2 

cmake CC=$CC -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=${PREFIX} -DSTATIC=OFF -DCMAKE_INSTALL_LIBDIR=${PREFIX}/lib -DCMAKE_EXE_LINKER_FLAGS=-L${PREFIX}/lib .
cmake --build $SRC_DIR/build --config "Release"
cmake --install $PREFIX/bin