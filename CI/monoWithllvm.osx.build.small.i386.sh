#!/bin/bash
source CI/ccache.enable.sh
CI/mono.llvm.osx.i386.sh
source CI/mono-llvm32.enable.sh
CI/mono.osx.build.small.i386.sh
make install
