#!/bin/bash

## Give the Job a descriptive name
#PBS -N gol1024

## Output and error files
#PBS -o gol1024.out
#PBS -e gol1024.err

## Limit memory, runtime etc.
#PBS -l walltime=01:00:00

## How many nodes:processors_per_node should we get?
#PBS -l nodes=1:ppn=8

## Start 
##echo "PBS_NODEFILE = $PBS_NODEFILE"
##cat $PBS_NODEFILE

## Run the job (use full paths to make sure we execute the correct thing) 
## NOTE: Fix the path to show to your executable!

module load openmp
cd $HOME/lab1

for nthreads in 1 2 4 6 8
do
  	export OMP_NUM_THREADS=$nthreads
  	./Game_Of_Life 1024 1000
done
