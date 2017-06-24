//compilar:sudo g++ -Wall -pthread -o proyectfull.exe GPIOImplementation.cpp proyect.cpp -lpigpio 
#include <istream>
#include <unistd.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include "../interface/GPIOClass.h"
#include <pigpio.h>
#include <sys/time.h>

using namespace std;
GPIOClass* gpio17 = new GPIOClass("17");
GPIOClass* gpio27 = new GPIOClass("27");
string inputstate;
void initialise();
float measure();
int duty=255;

int main()
{
	float s=0;
	initialise();
	gpioInitialise();
	gpioSetMode(22, PI_OUTPUT);//PWM
	gpioSetMode(23, PI_OUTPUT);//control de giro
	gpioSetMode(24, PI_OUTPUT);//control de giro
	gpioSetPWMfrequency(22, 50);
	gpioSetPWMrange(22, 260);
	gpioPWM(22, 0);
	gpioWrite(23, 1);
	gpioWrite(24, 0);
	for (int i=0;i<25;i++)
	{   s=measure();
	cout<<s<<" centimetros."<<endl;
	sleep(1);
	i=0;
	if((s>=0)&&(s<60))
	{  if(s>29)
	{ gpioWrite(23, 1);
	gpioWrite(24, 0);
	gpioPWM(22, (s-30)*13);
	}
	if((s<=29)&&(s>=26))
	{ gpioWrite(23, 0);
	gpioWrite(24, 0);
	gpioPWM(22, 0);
	
	}
	if((s>5)&&(s<26))
	{ gpioWrite(23, 0);
	gpioWrite(24, 1);
	gpioPWM(22, (s-5)*13);
	
	}
	if(s<=5)
	{ gpioWrite(23, 0);
	gpioWrite(24, 0);
	gpioPWM(22, 0);
	
	}
	}
	}
	return 0;
}

void initialise()
{
	gpio17->export_gpio();
	gpio27->export_gpio();
	gpio17->setdir_gpio("in");
	gpio27->setdir_gpio("out");
}

float measure()
{
	float a;
	struct timeval stop,start;
	sleep(0.5);
	gpio27->setval_gpio("1");
	usleep(10);
	gpio27->setval_gpio("0");
	gpio17->getval_gpio(inputstate);
	while (inputstate=="0")
	{
		gpio17->getval_gpio(inputstate);
		gettimeofday(&start, NULL);
	}//Mide el tiempo en el que está en bajo
	while (inputstate=="1")
	{
		gpio17->getval_gpio(inputstate);
		gettimeofday(&stop, NULL);
	}//Mide el tiempo en el que está en alto
	//a = ((stop.tv_usec - start.tv_usec)/58);
	a=(stop.tv_usec - start.tv_usec)*17150/1000000;
	//resta el tiempo total para obtener el tiempo que tardó en regresar la señal
	//Se divide entre 58 para convertir uS a Segundos y de Metros a centimetros. Entonces
	//range = high level time * velocity (340M/S) / 2
	//a uS*(170 M/S)*(1S/1000000uS)*(100 cm/M) = a/58 cm
	return a;
}
