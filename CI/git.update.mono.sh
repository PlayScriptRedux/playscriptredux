#!/bin/bash
pushd mono

# Danger, this is for sync'ing the master redux, not a dev's repo
git reset --hard
git clean -d -f
git checkout master
git pull

popd
