#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_kmeans_red_4

## Output and error files
#PBS -o run_kmeans_red_4.out
#PBS -e run_kmeans_red_4.err

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd ~/lab2/kmeans

for nthreads in 32 64
do
        export OMP_NUM_THREADS=$nthreads
        export GOMP_CPU_AFFINITY=0-31, 0-31
        ./kmeans_omp_reduction -s 256 -n 16 -c 16 -l 10
done


for nthreads in 32 64
do
        export OMP_NUM_THREADS=$nthreads
        export GOMP_CPU_AFFINITY=0-31, 0-31
        ./kmeans_omp_reduction -s 256 -n 1 -c 4 -l 10
done
