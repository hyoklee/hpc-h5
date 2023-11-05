#!/bin/bash
echo "Running CTest"
cd /lustre/orion/csc332/scratch/hyoklee/hdf5/build
ctest -T Build --output-on-error -j
ctest -T Test -E MPI --output-on-error --timeout 300 -j

