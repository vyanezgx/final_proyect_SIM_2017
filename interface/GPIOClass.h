#ifndef GPIO_CLASS_H
#define GPIO_CLASS_H

#include <string>

using namespace std;

class GPIOClass
{

public:
	GPIOClass();  // Default Constructor
	GPIOClass (string x);   // Custom constructor

	int export_gpio();  // export the desired GPIO
	int unexport_gpio(); // unexport the desired GPIO
  	int setdir_gpio (string dir);    // Set GPIO Direction
  	int setval_gpio (string val);  // Set GPIO Value
  	int getval_gpio (string &val);  // Get the actual GPIO value
  	string get_gpionum ();  //  return the GPIO associated with the instance of an object


private:
  	string gpionum;  // GPIO number associated with the instance of an object
};

#endif

