// Gabe Skorski, Program #3
// The goal of the program is to practice parameter passing. It simulates an airport radar installation,
// and conducts calculations on point locations and directions given by the user. It uses the iostream
// to get and display output, as well as math.h to do some of the calculating.

#include<iostream>
#include<math.h>
using namespace std;

void basicCalculations(void);
void rectangularInput(double& xCoordinate, double& yCoordinate);
void polarInput(double& radius, double& degrees);
void csRep1(void);
void csRep2(void);
void csRep3(void);
void csRep4(void);
void csRep5(void);
double engineer1(double x1Coor, double y1Coor, double x2Coor, double y2Coor);
void engineer2(double xCoor, double yCoor, double& radius, double& degrees);
void engineer3(double radius, double degrees, double& xCoor, double& yCoor);
void engineer4(double x1Coor, double y1Coor, double x2Coor, double y2Coor, double time, double& speed, double& direction);
void engineer5(double& radius, double& degrees, double headAngle, double headSpeed, double travelTime);
double PI = 3.14159;

//main
int main() {

	int menuChoice;
		
	cout << "This program can perform various calculations to determine the speed and direction, or destination, " << endl;
	cout << "of an object using two polar coordinates. It can also do some minor calculations as well such as" << endl; 
	cout << "determining distance, and converting coordinates from polar to cartesian or the other way." << endl << endl;

	do {
		cout << "What would you like to do? Type the number and hit enter" << endl << endl;
		cout << "	(1) Get the speed and direction." << endl << endl;
		cout << "	(2) Get the destination." << endl << endl;
		cout << "	(3) Conduct basic calculations." << endl << endl;
		cout << "	(4) Quit the program." << endl << endl;

		cin >> menuChoice;
		cout << endl;

		if (menuChoice == 1) {
			csRep4();
		}
		else if (menuChoice == 2) {
			csRep5();
		}
		else if (menuChoice == 3) {
			basicCalculations();
		}
		else {
			if (menuChoice > 4) {
				cout << "Sorry, that wasn't a menuChoice." << endl; 
				cout << "Please pick one of the four options." << endl << endl;
			}
		}

	} while (menuChoice != 4);

	cout << "Thanks for using the program." << endl;
	return 0;
}

//basic calculations
void basicCalculations(){
	
	int menuChoice;

	do {
		cout << "What would you like to do? Type the number and hit enter" << endl << endl;
		cout << "	(1) Find the distance between 2 pairs of rectangular coordinates." << endl << endl;
		cout << "	(2) Convert one pair of coordinates from rectangular to polar." << endl << endl;
		cout << "	(3) Convert one pair of coordinates from polar to rectangular." << endl << endl;
		cout << "	(4) Go back to the main menu." << endl << endl;

		cin >> menuChoice;
		cout << endl;

		if (menuChoice == 1) csRep1();
		if (menuChoice == 2) csRep2();
		if (menuChoice == 3) csRep3();


	} while (menuChoice != 4);

	
}

//input ask for rect
void rectangularInput(double& xCoordinate, double& yCoordinate) {
	
	cout << "Enter the X value: ";
	cin >> xCoordinate;
	cout << "Enter the Y value: ";
	cin >> yCoordinate;
}

//input ask for polar
void polarInput(double& radius, double& degrees) {
	do {
		cout << "Enter the radius (positive value) in miles: ";
		cin >> radius;
	} while (radius < 0);

	do {
		cout << "Enter the angle (between -360 and 360) in degrees: ";
		cin >> degrees;
	} while (degrees >= 360 || degrees <= -360);
}


//customer service 1
void csRep1() {
	double x1Coor, y1Coor, x2Coor, y2Coor;

	cout << "For the first Coordinate pair - " << endl;
	rectangularInput(x1Coor, y1Coor);
	cout << endl << "For the second Coordinate pair - " << endl;
	rectangularInput(x2Coor, y2Coor);
	
	double distance = engineer1(x1Coor, y1Coor, x2Coor, y2Coor);
	cout << endl << "The distance is " << distance << " miles away." << endl << endl;
}

//engineer 1 - for distance
double engineer1(double x1Coor, double y1Coor, double x2Coor, double y2Coor) {
	double distance = sqrt(pow((x2Coor - x1Coor), 2.0) + pow((y2Coor - y1Coor), 2.0));
	return distance;
}

//customer service 2
void csRep2() {
	double xCoor, yCoor, radius, degrees;
	
	cout << "To convert from rectangular coordinates to polar - " << endl;
	rectangularInput(xCoor, yCoor);
	cout << "The rectangular pair ( " << xCoor << " , " << yCoor << " ) translates to: ";
	engineer2(xCoor, yCoor, radius, degrees);
	cout << radius << " miles away at " << degrees << " degrees." << endl << endl;

}

//engineer 2 - for rectangular to polar
void engineer2(double xCoor, double yCoor, double& radius, double& degrees) {

	radius = engineer1(0.0, 0.0, xCoor, yCoor);
	
	if (xCoor == 0 && yCoor >= 0) {
		degrees = 90;
	}
	else if (xCoor == 0 && yCoor < 0) {
		degrees = -90;
	}
	else {
		double theta = atan(yCoor / xCoor);
		degrees = theta * (180.0 / PI);
		if (xCoor < 0) {
			degrees = degrees + 180.0;
		}
	} 

}

//customer service 3
void csRep3() {
	double radius, degrees, xCoor, yCoor;
	cout << "To convert from polar coordinates to rectangular - " << endl;
	polarInput(radius, degrees);
	cout << endl << "The polar coordinates ( " << radius << " , " << degrees << " ) translates to " << endl;
	engineer3(radius, degrees, xCoor, yCoor);
	cout << "the rectangular coordinates: ( " << xCoor << " , " << yCoor << " )." << endl << endl;
}

//engineer 3 - for polar to rectangular
void engineer3(double radius, double degrees, double& xCoor, double& yCoor) {
	double theta = degrees * (PI / 180);
	xCoor = radius * cos(theta);
	yCoor = radius * sin(theta);
}

// customer service 4
void csRep4() {
	double x1Coor, y1Coor, x2Coor, y2Coor, time, speed, direction;
	double radius1, degrees1, radius2, degrees2;
	
	cout << "First we will need two consecutive locations of the object in polar coordinates." << endl;
	
	cout << "For the first coordinate - " << endl;
	polarInput(radius1, degrees1);
	engineer3(radius1, degrees1, x1Coor, y1Coor);

	cout << "For the second coordinate - " << endl;
	polarInput(radius2, degrees2);
	engineer3(radius2, degrees2, x2Coor, y2Coor);

	cout << "How much time (in hours) has elapsed between the two points: ";
	cin >> time;

	engineer4(x1Coor, y1Coor, x2Coor, y2Coor, time, speed, direction);

	cout << endl << "The object is heading at an angle of " << direction << " degrees. At " <<
		speed << " miles an hour." << endl << endl;
}

//engineer 4 - determine speed and direction
void engineer4(double x1Coor, double y1Coor, double x2Coor, double y2Coor, double time, double& speed, double& direction) {
	double radius;
	double newXCoor = x1Coor - x2Coor;
	double newYCoor = y1Coor - y2Coor;
	engineer2(newXCoor, newYCoor, radius, direction);
	speed = radius / time;
}

//customer service 5
void csRep5() {
	double radius, degrees, headAngle, headSpeed, travelTime;

	cout << "First we need the object location (in polar coordinates), its heading, and the time travelled." << endl;
	
	cout << "For the location - " << endl;
	polarInput(radius, degrees);
	
	cout << "What direction (in degrees) is it headed?: ";
	cin >> headAngle;

	cout << "At what speed (in miles per hour) is it moving?: ";
	cin >> headSpeed;

	cout << "What is the time (in hours) travelled?: ";
	cin >> travelTime;

	engineer5(radius, degrees, headAngle, headSpeed, travelTime);

	cout << endl << "The object's current destination in polar coordinates is ( " << radius << " , " << degrees << " )." << endl << endl;
}

//engineer 5 - determine destination in polar
void engineer5(double& radius, double& degrees, double headAngle, double headSpeed, double travelTime) {
	double distance = headSpeed * travelTime;
	
	//given polar vector
	double a1Coor = radius;
	double b1Coor = degrees;
	
	//computed heading polar vector
	double a2Coor = distance;
	double b2Coor = headAngle;
	
	//convert to rectangular
	engineer3(radius, degrees, a1Coor, b1Coor);
	engineer3(distance, headAngle, a2Coor, b2Coor);
	
	//vector addition
	double newA = a1Coor + a2Coor;
	double newB = b1Coor + b2Coor;
	
	//convert back to polar
	engineer2(newA, newB, radius, degrees);
}