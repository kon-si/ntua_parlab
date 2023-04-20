#!/bin/bash

## Give the Job a descriptive name
#PBS -N make

## Output and error files
#PBS -o make.out
#PBS -e make.err

## How many machines should we get?
#PBS -l nodes=1:ppn=1

#PBS -l walltime=00:05:00

cd ~/lab6/serial
module load openmpi/1.8.3
make
