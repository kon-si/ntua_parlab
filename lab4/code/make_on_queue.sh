#!/bin/bash

## Give the Job a descriptive name
#PBS -N make_data_struct

## Output and error files
#PBS -o make_data_struct.out
#PBS -e make_data_struct.err

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd ~/lab4
make
