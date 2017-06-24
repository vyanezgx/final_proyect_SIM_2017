// Implementation of the interface GPIOClass

#include <fstream>
#include <string>
#include <iostream>
#include "../interface/GPIOClass.h"


#define GPIO_PATH  "/sys/class/gpio/"

using namespace std;

/**
 *@Brief: Default constructor implementation
 */
GPIOClass::GPIOClass ()
{
    this ->gpionum="4";  //  GPIO4 is default (optional)
}

/**
 * @Brief:  Custom constructor implementation
 */

GPIOClass::GPIOClass(string gnum)
{
   this ->gpionum=gnum;	 // Instantiate GPIOClass object for GPIO pin number "gnum"
}

int GPIOClass:: export_gpio()
{
	// What functions is used for export?  Help me
	string export_str = "/sys/class/gpio/export";
	ofstream exportgpio(export_str.c_str()); //  Open "export" file. Convert C++ string to C string. Required for all Linux pathhnames

		if (exportgpio < 0) {
			cout << "ERROR:  Unable to export GPIO" << this->gpionum <<"." << endl;
		return -1;
		}

	exportgpio<< this->gpionum; // write GPIO number to export
	exportgpio.close();         // close the export file
	return 0;
}


int GPIOClass::unexport_gpio()
{

	string unexport_str = "/sys/class/gpio/unexport";
	ofstream unexportgpio(unexport_str.c_str());
		if (unexportgpio<0 ) {
			cout << "ERROR: Unable to unexport GPIO" << this->gpionum<< "."<< endl;
		}

	unexportgpio<<this->gpionum;
	unexportgpio.close();
	return 0;
}

int GPIOClass::setdir_gpio(string dir) {

	string setdir_str ="/sys/class/gpio/gpio" + this->gpionum + "/direction";
	ofstream setdirgpio(setdir_str.c_str());

		if (setdirgpio<0) {
			cout << "ERROR: Unable to set direction for GPIO "<< this->gpionum<<"." << endl;
			return -1;
		}
	setdirgpio <<dir;  // write direction to direction file
	setdirgpio.close();  // close direction file
	return 0;

}

/**
 * @Brief:  Function for setting the value of the GPIO
 */

int GPIOClass::setval_gpio(string val) {

	string setval_str = "/sys/class/gpio/gpio" + this->gpionum + "/value";
	ofstream setvalgpio(setval_str.c_str());
		if (setvalgpio<0) {
			cout<<"ERROR:  Unable to give a value to gpio "<<this->gpionum<< "."<<endl;
		return -1;
		}

	setvalgpio << val;
	setvalgpio.close();
	return 0;

}

/**
 * @ Brief:  Function for getting the actual value of the GPIO
 */

int GPIOClass::getval_gpio (string &val){
	string getval_str = "/sys/class/gpio/gpio" + this->gpionum + "/value";
	ifstream getvalgpio(getval_str.c_str());

		if(getvalgpio<0) {
			cout<<"ERROR: Unable to get the actual value of GPIO"<< this->gpionum << "."<<endl;
			return -1;
		}
	getvalgpio >> val;  // read GPIO value

		if (val !="0")  val="1";
		else
			val= "0";

	getvalgpio.close(); // close the value file
	return 0;

}


string GPIOClass:: get_gpionum(){
	return this->gpionum;
}


















