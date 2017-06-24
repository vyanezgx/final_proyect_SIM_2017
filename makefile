build: pre compile asm linker 

pre: 
	cpp proyect.cpp > proyect.i

compile:
	g++ -S proyect.i

asm:
	as -o proyect.o proyect.s

linker:
	sudo g++ -Wall -pthread -o proyect.exe GPIOImplementation.cpp proyect.cpp -lpigpio
run:
	sudo ./proyect.exe

clean:
	rm proyect.i proyect.s proyect.o proyect.exe