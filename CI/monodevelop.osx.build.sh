#!/bin/bash
pushd monodevelop
git fetch mono
git reset --hard
git checkout upstream/master
git pull mono master
git submodule update --init --recursive
./configure --profile=mac --prefix=${HOME}/mono/monodevelop
make
pushd main/build/MacOSX 
make
./make-dmg-bundle.sh
popd
popd

