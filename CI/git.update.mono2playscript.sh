#!/bin/bash
pushd playscript

# Danger, this is for sync'ing the master redux, not a dev's repo
git reset --hard
git clean -d -f

git fetch mono
git fetch upstream master # avoid the initial: src refspec master does not match any.
# Following needed to setup the initial master tracking branch
git checkout -t -b master remotes/upstream/master
git checkout master
git merge mono/master
git push upstream master
if [ -z ${GIT_USER+x} ]; then
   echo "No GIT_USER assigned"
else
   git push origin master
fi
# Checkout playscript branch back out so super project commits tracks that branch
git checkout playscript

popd

pushd mono
git fetch origin
popd

