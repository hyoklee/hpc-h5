#!/usr/bin/bash

. /etc/profile
. /ccs/home/hyoklee/.bashrc
echo "Hello" > /ccs/home/hyoklee/tmp/hello.txt
d="/lustre/orion/csc332/scratch/hyoklee/"
cd $d
rm -rf hdf5
git clone https://github.com/HDFGroup/hdf5
cd hdf5
mkdir build
cd build
cmake \
    -D BUILDNAME:STRING=cce \
    -D CTEST_DROP_SITE_INIT:STRING="my.cdash.org" \
    -D DART_TESTING_TIMEOUT:STRING="300" \
    -D HDF5_BUILD_FORTRAN:BOOL=ON \
    -D HDF5_ENABLE_MAP_API:BOOL=OFF \
    -D HDF5_ENABLE_PARALLEL:BOOL=ON \
    -D HDF5_ENABLE_SUBFILING_VFD:BOOL=OFF \
    -D HDF5_ENABLE_SZIP_SUPPORT:BOOL=OFF \
    -D HDF5_ENABLE_Z_LIB_SUPPORT:BOOL=ON \
    -D SITE:STRING=frontier \
    ..
sbatch /ccs/home/hyoklee/src/hpc-h5/bin/j_fr.slurm
sleep 7200
ctest -T Submit
echo "Hello2" > /ccs/home/hyoklee/tmp/hello2.txt
