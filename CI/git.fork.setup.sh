#!/bin/bash

# mono
pushd playscript
git remote add mono https://github.com/mono/mono.git
git remote set-url --push mono DISABLE

git remote rename origin upstream

# if this is a dev setup, add origin
if [ -z ${GIT_USER+x} ]; then
   echo "No GIT_USER assigned"
else
   git remote add origin https://github.com/${GIT_USER}/playscript.git
fi
popd

# monodevelop
pushd monodevelop
git remote add mono https://github.com/mono/monodevelop.git
git remote set-url --push mono DISABLE

git remote rename origin upstream

# if this is a dev setup, add origin
if [ -z ${GIT_USER+x} ]; then
   echo "No GIT_USER assigned"
else
   git remote add origin https://github.com/${GIT_USER}/playscript.git
fi
popd


