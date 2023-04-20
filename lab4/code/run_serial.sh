#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_serial

## Output and error files
#PBS -o run_serial.out
#PBS -e run_serial.err

##How long should the job run for?
#PBS -l walltime=00:20:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd ~/lab4

for lsize in 1024 8192
do
	./x.serial $lsize 100 0 0
	./x.serial $lsize 80 10 10
	./x.serial $lsize 20 40 40
	./x.serial $lsize 0 50 50
done
