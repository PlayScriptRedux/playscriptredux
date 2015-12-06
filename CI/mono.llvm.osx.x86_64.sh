#!/bin/bash
pushd mono-llvm

git fetch --all
git reset --hard
git checkout mono/master
git merge origin master
./configure --prefix=${HOME}/mono/llvm64 \
	--enable-optimized \
	--enable-targets="x86 x86_64" 
make clean
make && make install

popd
