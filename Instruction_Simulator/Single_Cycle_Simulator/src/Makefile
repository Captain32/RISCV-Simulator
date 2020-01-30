all:	my_simulator

my_simulator:	Read_Elf.h Read_Elf.cpp Simulation.h Simulation.cpp
		g++ -c Read_Elf.h Read_Elf.cpp Simulation.h Simulation.cpp
		g++ Read_Elf.o Simulation.o -o $@ -lm

clean:
	rm -rf my_simulator *.o
