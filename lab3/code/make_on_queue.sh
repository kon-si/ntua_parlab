#!/bin/bash

## Give the Job a descriptive name
#PBS -N make_kmeans_lock

## Output and error files
#PBS -o make_kmeans_lock.out
#PBS -e make_kmeans_lock.err

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd ~/lab3
make
