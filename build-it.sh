#!/usr/bin/env bash

set -ex

cd "$(dirname "$0")"

./configure \
    --set llvm.plugins=true \
    --set llvm.link-shared=true \
    --set rust.lld=false \
    --set rust.use-lld=false \
    --set target.x86_64-unknown-linux-gnu.llvm-config=/usr/bin/llvm-config-18

./x.py build
./x.py install

ls -al /output
