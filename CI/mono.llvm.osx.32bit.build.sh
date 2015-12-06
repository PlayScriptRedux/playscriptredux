#!/bin/bash
pushd mono-llvm

git fetch --all
git reset --hard
git checkout mono/master
git merge origin master
./configure --prefix=${HOME}/mono/llvm32 \
	--enable-optimized \
	--enable-targets="x86 x86_64" \
	--target=i386-apple-darwin15.0.0
make clean
make && make install

popd
