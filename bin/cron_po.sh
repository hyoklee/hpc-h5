#!/usr/bin/bash

. /etc/profile

echo "Hello" > /home/hyoklee/bin/hello_polaris.txt
module load e4s/22.08
module load cmake

cd /lus/grand/projects/CSC250STDM10/hyoklee/hdf5
/home/hyoklee/bin/ckrev
rc_h5=$?

if [ $rc_h5 -eq 1 ]
then   
   # Submit a parallel job for testing.
   cd /home/hyoklee/src/hpc-h5/bin
   qsub j_po.pbs
   sleep 2400
   cd /lus/grand/projects/CSC250STDM10/hyoklee/hdf5/build && ctest -T Submit
fi

# To measure time
echo "Hello2" > /home/hyoklee/bin/hello2_polaris.txt
