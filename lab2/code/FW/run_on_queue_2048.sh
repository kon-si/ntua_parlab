#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_fw_pr_2048

## Output and error files
#PBS -o run_fw_pr_2048.out
#PBS -e run_fw_pr_2048.err

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd ~/lab2/FW

for B in 16 32 64 128 256 512
do
	for thr in 1 2 4 8 16 32 64
	do
        	export OMP_NUM_THREADS=$thr
        	./fw_pr 2048 $B
	done
done
