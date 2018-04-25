CC=gcc
CFLAGS=-I.


all : utils.o process_memory parallel_min_max parallel_sum find_min_max.o zombie

utils.o : utils.h
	$(CC) -o utils.o -c utils.c $(CFLAGS)

process_memory : process_memory.c
	$(CC) -o process_memory process_memory.c $(CFLAGS)
	
parallel_min_max : utils.o find_min_max.o utils.h find_min_max.h
	$(CC) -o parallel_min_max utils.o find_min_max.o parallel_min_max.c $(CFLAGS)

parallel_sum : utils.o utils.h 
	$(CC) -g -pthread -o parallel_sum utils.o parallel_sum.c $(CFLAGS)

find_min_max.o : utils.h find_min_max.h
	$(CC) -o find_min_max.o -c find_min_max.c $(CFLAGS)

zombie : zombie.c
	$(CC) -o zombie zombie.c $(CFLAGS)
	
clear : 
	rm zombie utils.o process_memory parallel_min_max parallel_sum find_min_max.o