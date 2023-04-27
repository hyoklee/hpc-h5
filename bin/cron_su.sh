#!/usr/bin/bash

. /etc/profile
. /home/hyoklee/.bashrc

echo "Hello" > /home/hyoklee/bin/hello.txt
module load daos/base

cd /lus/gila/projects/CSC250STDM10_CNDA/hyoklee/hdf5
/home/hyoklee/bin/ckrev
rc_h5=$?

if [ $rc_h5 -eq 1 ]
then
   cd /home/hyoklee/src/hpc-h5/bin
   qsub j_su.pbs
fi

# To measure time
echo "Hello2" > /home/hyoklee/bin/hello2.txt
