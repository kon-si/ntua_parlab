#!/bin/bash

## Give the Job a descriptive name
#PBS -N make_gol

## Output and error files
#PBS -o make_gol.out
#PBS -e make_gol.err

## How many machines should we get?
#PBS -l nodes=1

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd $HOME/lab1
make
