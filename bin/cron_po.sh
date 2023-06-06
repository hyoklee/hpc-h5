#!/usr/bin/bash

. /etc/profile

echo "Hello" > /home/hyoklee/bin/hello_polaris.txt
module load e4s/22.08
module load cmake
d="/lus/grand/projects/CSC250STDM10/hyoklee/hdf5"
cd $d
/home/hyoklee/bin/ckrev
rc_h5=$?

if [ $rc_h5 -eq 1 ]
then   
    # Submit a parallel job for testing.
    rm -rf $d/build
    mkdir $d/build
    cd $d/build
    /home/hyoklee/src/hpc-h5/bin/cmake.sh
    ctest -T Build --output-on-error -j
    cd /home/hyoklee/src/hpc-h5/bin
    qsub j_po.pbs
    sleep 60m && cd $d/build && ctest -T Submit
fi

# To measure time
echo "Hello2" > /home/hyoklee/bin/hello2_polaris.txt
