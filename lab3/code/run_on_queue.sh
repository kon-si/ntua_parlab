#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_kmeans

## Output and error files
#PBS -o run_kmeans.out
#PBS -e run_kmeans.err

##How long should the job run for?
#PBS -l walltime=00:20:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd ~/lab2/kmeans

for nthreads in 1 2 4 8 16 32 64
do
        export OMP_NUM_THREADS=$nthreads
        export GOMP_CPU_AFFINITY=0-$(expr $nthreads - 1)
	./kmeans_omp_naive -s 16 -n 16 -c 16 -l 10
done
