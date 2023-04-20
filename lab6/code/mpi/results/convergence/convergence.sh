#!/bin/bash

## Give the Job a descriptive name
#PBS -N conv

## Output and error files
#PBS -o conv.out
#PBS -e conv.err

## How many machines should we get?
#PBS -l nodes=8:ppn=8

#PBS -l walltime=00:20:00

module load openmpi/1.8.3
cd ~/lab6/mpi

for exe in jacobi seidelsor
do
	mpirun -np 64 --map-by node --mca btl self,tcp ${exe} 1024 1024 8 8
done
