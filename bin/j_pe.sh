#!/bin/bash
echo "Running CTest"
cd /pscratch/sd/h/hyoklee/hdf5/build
module load nvhpc/23.1
# cmake .. -D HDF5_ENABLE_PARALLEL:BOOL=ON -D HDF5_BUILD_FORTRAN:BOOL=ON
ctest -T Build --output-on-error -j
ctest -T Test --output-on-error -j

