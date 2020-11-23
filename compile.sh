#!/usr/bin/env bash
set -e

mkdir -p log

make clean && make -j32

bFiles=(
"kernel"
"bootasm.o"
"bootblock"
)

for ((i=0; i<${#bFiles[@]}; i++))
do
    currentBFile=${bFiles[i]}
    readelf -Wa  $currentBFile > log/readelf-Wa_$currentBFile.log
    objdump -CdS $currentBFile > log/objdump-CdS_$currentBFile.log
done

if [[ $1 == 'gdb' ]]; then
    make qemu-gdb
fi
