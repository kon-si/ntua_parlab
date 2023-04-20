#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_opt

## Output and error files
#PBS -o run_opt.out
#PBS -e run_opt.err

##How long should the job run for?
#PBS -l walltime=00:20:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd ~/lab4

for nthreads in 1 2 4 8 18 32 64 128
do
	if [ $nthreads -eq 128 ]
	then
		export MT_CONF=`seq -f "%g," 0 63``seq -s, 0 63`
        else
		export MT_CONF=`seq -s, 0 $(expr $nthreads - 1)`
	fi
	
	for lsize in 1024 8192
	do
		./x.opt $lsize 100 0 0
		./x.opt $lsize 80 10 10
		./x.opt $lsize 20 40 40
		./x.opt $lsize 0 50 50
	done
done
