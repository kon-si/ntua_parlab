#!/bin/bash

## Give the Job a descriptive name
#PBS -N serial

## Output and error files
#PBS -o serial.out
#PBS -e serial.err

## How many machines should we get?
#PBS -l nodes=8:ppn=8

#PBS -l walltime=00:20:00

cd ~/lab6/serial
./jacobi 256
##./seidelsor 1024
##./redblacksor 1024
