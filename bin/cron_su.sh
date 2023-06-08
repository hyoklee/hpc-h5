#!/usr/bin/bash

. /etc/profile
. /home/hyoklee/.bashrc

echo "Hello" > /home/hyoklee/bin/hello.txt
module load daos/base

d="/lus/gila/projects/CSC250STDM10_CNDA/hyoklee/hdf5"
cd $d
/home/hyoklee/bin/ckrev
rc_h5=$?

if [ $rc_h5 -eq 1 ]
then
   rm -rf $d/build
   mkdir $d/build
   cd $d/build
   /home/hyoklee/src/hpc-h5/bin/cmake.sh
   ctest -T Build --output-on-error -j
   cd /home/hyoklee/src/hpc-h5/bin
   qsub j_su.pbs
fi

# To measure time
echo "Hello2" > /home/hyoklee/bin/hello2.txt
