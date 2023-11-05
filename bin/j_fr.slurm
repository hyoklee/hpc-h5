#!/bin/bash
##
## Usage: sbatch j_fr.slurm
## Author: Hyokyung Lee (hyoklee@hdfgroup.org)
## Last Update: 2023-10-27
##
#SBATCH -A CSC444
#SBATCH -J h5
#SBATCH -o %x-%j.out
#SBATCH -t 02:00:00
#SBATCH -N 1
#SBATCH -S 0
#SBATCH --ntasks-per-node=6
#SBATCH -p batch
#SBATCH -q debug
#SBATCH --mail-type=ALL
#SBATCH --mail-user=hyoklee@hdfgroup.org

srun -N1 -n1 /ccs/home/hyoklee/src/hpc-h5/bin/j_fr.sh
