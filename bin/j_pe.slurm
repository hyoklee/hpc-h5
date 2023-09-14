#!/bin/bash
##
## Usage: sbatch j_pe.slurm
## Author: Hyokyung Lee (hyoklee@hdfgroup.org)
## Last Update: 2023-09-14
##
#SBATCH -A m2621
#SBATCH -C cpu
#SBATCH -q debug
#SBATCH -J h5
#SBATCH -o %x-%j.out
#SBATCH -t 00:30:00
#SBATCH -N 6
#SBATCH --ntasks-per-node=6

srun -N1 -n1 ./j_pe.sh
