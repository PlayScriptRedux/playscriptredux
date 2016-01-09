#!/bin/bash
pushd monomac
DIRS=src make clean
DIRS=src make
popd

