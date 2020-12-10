#!/usr/bin/env bash
set -e

make clean && make -j32 && make qemu-gdb
