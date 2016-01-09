#!/bin/bash
find . -name ".DS_Store*" -print0 | xargs -0 -n 1 rm

