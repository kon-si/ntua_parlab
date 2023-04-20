#!/bin/bash

## Give the Job a descriptive name
#PBS -N scal

## Output and error files
#PBS -o scal.out
#PBS -e scal.err

## How many machines should we get?
#PBS -l nodes=8:ppn=8

#PBS -l walltime=00:30:00

module load openmpi/1.8.3
cd ~/lab6/mpi

for exe in jacobi seidelsor
do
	for size in 2048 4096 6144
	do
		mpirun -np 1 --map-by node --mca btl self,tcp ${exe} ${size} ${size} 1 1
		mpirun -np 2 --map-by node --mca btl self,tcp ${exe} ${size} ${size} 2 1
		mpirun -np 4 --map-by node --mca btl self,tcp ${exe} ${size} ${size} 2 2
		mpirun -np 8 --map-by node --mca btl self,tcp ${exe} ${size} ${size} 4 2
		mpirun -np 16 --map-by node --mca btl self,tcp ${exe} ${size} ${size} 4 4
		mpirun -np 32 --map-by node --mca btl self,tcp ${exe} ${size} ${size} 8 4
		mpirun -np 64 --map-by node --mca btl self,tcp ${exe} ${size} ${size} 8 8
	done
done
