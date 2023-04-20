CC=mpicc
CFLAGS=-O3 -Wall -lm
RES=#-DPRINT_RESULTS
CONV=#-DTEST_CONV

all: jacobi seidelsor

jacobi: Jacobi_mpi.c utils.c
	$(CC) $(CFLAGS) $(RES) $(CONV) Jacobi_mpi.c utils.c -o jacobi

seidelsor: GaussSeidelSOR_mpi.c utils.c
	$(CC) $(CFLAGS) $(RES) $(CONV) GaussSeidelSOR_mpi.c utils.c -o seidelsor

clean:
	rm jacobi seidelsor
