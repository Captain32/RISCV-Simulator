all:	my_simulator

my_simulator:	def.h storage.h cache.h cache.cc memory.h memory.cc Read_Elf.h Read_Elf.cpp Register.h Simulation.h Simulation.cpp
		g++ -c def.h storage.h cache.h cache.cc memory.h memory.cc Read_Elf.h Read_Elf.cpp Register.h Simulation.h Simulation.cpp
		g++ cache.o memory.o Read_Elf.o Simulation.o -o $@ -lm

clean:
	rm -rf my_simulator *.o *.gch
