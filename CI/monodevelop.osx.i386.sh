#!/bin/bash
pushd monodevelop
git fetch mono
git reset --hard
git checkout upstream/master
git pull mono master
git submodule sync
git submodule update --init --recursive
./configure --prefix=${HOME}/mono/monodevelop
make clean

# Quick fix for broken build
pushd monodevelop//main/external/fsharpbinding/
git reset --hard
./configure.sh
make
popd

make
pushd main/build/MacOSX 
make render.exe
make app
./make-dmg-bundle.sh
popd
popd

