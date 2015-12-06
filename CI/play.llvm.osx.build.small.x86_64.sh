#!/bin/bash
source CI/ccache.enable.sh
CI/mono.llvm.osx.64bit.build.sh
pushd playscript
git submodule update --init --recursive
CI/play.llvm.osx.build.small.x86_64.sh
make install
popd
