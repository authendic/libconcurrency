LIBNAME=libconcurrency

# library name and version
SONAME=../../$(LIBNAME).so.0.8

# compiler and linker flags
#CFLAGS=-W -Wall -c -g -O2 -fPIC -fomit-frame-pointer -I./
CFLAGS=-pedantic -g -ggdb3 -O0 -fPIC -I./ -I../../libconcurrency -I../../ -fno-inline-functions
LFLAGS=-lpthread -pthread

# compiler
CC=clang

ex1.bin: ex1.o $(SONAME)
	$(CC) $(LFLAGS) -o $@ $^

$(SONAME):
	make -C ../../

clean:
	rm *.o *.bin

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
