#!/usr/bin/bash

. /etc/profile
. /home/hyoklee/.bashrc

echo "Hello" > /home/hyoklee/bin/hello_polaris.txt
module load e4s/22.08

cd /lus/grand/projects/CSC250STDM10/hyoklee/hdf5
/home/hyoklee/bin/ckrev
rc_h5=$?

if [ $rc_h5 -eq 1 ]
   #/home/hyoklee/bin/ctsub
   # Submit a parallel job for testing.
   cd /home/hyoklee/src/hpc-h5/bin
   qsub j_po.pbs
fi


# To measure time
echo "Hello2" > /home/hyoklee/bin/hello2_polaris.txt
