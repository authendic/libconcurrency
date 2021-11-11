LIBNAME=libconcurrency

# library name and version
SONAME=$(LIBNAME).so.0.8

# compiler and linker flags
#CFLAGS=-W -Wall -c -g -O2 -fPIC -fomit-frame-pointer -I./
CFLAGS=-g -ggdb3 -pedantic -O0 -fPIC -I./ -fno-inline-functions
LFLAGS=-shared -Wl,-soname,$(SONAME) -o $(SONAME) $<

# compiler
CC=clang

default: libconcurrency/coro.o
	$(CC) $(LFLAGS)

clean:
	rm $(LIBNAME)/*.o *.so.*

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
