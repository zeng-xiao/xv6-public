#!/usr/bin/env bash
set -e

<<<<<<< HEAD
make clean && make -j32 && make qemu-gdb
=======
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
>>>>>>> 54d6ad894cad9c976061c8510bc394ecdf5ecdea
