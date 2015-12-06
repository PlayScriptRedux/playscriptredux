#!/bin/bash
source CI/ccache.enable.sh
CI/mono.llvm.osx.32bit.build.sh
pushd playscript
git submodule update --init --recursive
CI/play.llvm.osx.build.small.i386.sh
make install
popd
