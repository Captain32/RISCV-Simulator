all:	cache_simulator

cache_simulator:	def.h storage.h LIRSContainer.h cache.h cache.cc memory.h memory.cc main.cc
		g++ -c def.h storage.h LIRSContainer.h cache.h cache.cc memory.h memory.cc main.cc
		g++ cache.o memory.o main.o -o $@ -lm

clean:
	rm -rf cache_simulator *.o *.gch
