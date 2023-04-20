.phony: all clean

all: fw_pr

CC=gcc
CFLAGS= -Wall -O3 -Wno-unused-variable -fopenmp

HDEPS+=%.h

OBJS=util.o

fw_pr: $(OBJS) fw_pr.c 
	$(CC) $(OBJS) fw_pr.c -o fw_pr $(CFLAGS)

%.o: %.c $(HDEPS)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o fw_pr

