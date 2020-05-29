#makefile for my lib

binary: main.o libprime.so
	gcc main.o -L. -lprime -o pirmenumbers

main.o: main.c
	gcc -c main.c

libprime.so: prime.o
	gcc -shared -o libprime.so prime.o

prime.o: prime.c
	gcc -c -fPIC prime.c

clean:
	rm -f *.o *.so binary
