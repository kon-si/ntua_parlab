#!/bin/bash

## Give the Job a descriptive name
#PBS -N gauss_sor

## Output and error files
#PBS -o sor.out
#PBS -e sor.err


## How many machines should we get?
#PBS -l nodes=8:ppn=8

#PBS -l walltime=00:20:00

module load openmpi/1.8.3
cd ~/lab6/mpi

#mpirun -np 64 --map-by node --mca btl self,tcp jacobi 1024 1024 8 8

mpirun -np 64 --map-by node --mca btl self,tcp  seidelsor 1024 1024 8 8
coredump
