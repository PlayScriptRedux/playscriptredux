#!/bin/bash
find . -name "git.update.*" -print0 | xargs -0 -n 1 -J % sh -c %

