CC=gcc
CFLAGS=-O3 -lm -Wall
RES=-DPRINT_RESULTS
CONV=#-DTEST_CONV

all: jacobi seidelsor

jacobi: Jacobi_serial.c utils.c
	$(CC) $(CFLAGS) $(RES) $(CONV) Jacobi_serial.c utils.c -o jacobi

seidelsor: GaussSeidelSOR_serial.c utils.c
	$(CC) $(CFLAGS) $(RES) $(CONV) GaussSeidelSOR_serial.c utils.c -o seidelsor

clean:
	rm jacobi seidelsor

