// Gabe Skorski Program#9 The Sieve of Eratosthenes: 
// Using the Sieve of Eratosthenes algorithm, calculate and
// print a user-specified range of prime numbers.

#include<iostream>
#include<math.h>
using namespace std;

int* makeArray(int size);
int containsZero(int myArray[], int size);
void arrayFactor(int myArray[], int size, int factor);
void circleZero(int myArray[], int size);
int* finalArray(int myArray[], int& size);
int isGreaterThan(int factor, int highest);

int main() {

	int lowestInt;
	int highestInt;
	int* _array;
	char choice;

	//intro
	cout << "Welcome to the Prime Number Identifier!" << endl << endl;
	cout << "This program utilizes the Sieve of Eratosthenes algorithm " << endl;
	cout << "to determine a range of prime numbers." << endl;

	do {

		cout << endl << "To get started please enter a range of positive integers to look through.";

		do {
			cout << endl << "(Lowest number must be less than Highest number.)" << endl;

			do {
				cout << endl << "Lowest number (positive value): ";
				cin >> lowestInt;
			} while (lowestInt < 0);

			do {
				cout << "Highest number (positive value): ";
				cin >> highestInt;
			} while (highestInt < 0);


		} while (lowestInt > highestInt);

		//make size of array and the array
		int _size = highestInt + 1;
		_array = makeArray(_size);

		//execute algorithm
		arrayFactor(_array, _size, containsZero(_array, _size));
		_array = finalArray(_array, _size);


		//print the results
		cout << endl << "The Prime Numbers are: ";
		int* start = _array;
		int* end = _array + _size;
		while (start < end) {
			if (*start >= lowestInt) {
				cout << *start << " ";
			}
			++start;
		}
		//ask to redo
		cout << endl << endl << "Would you like to go again? (y for yes, any other key to quit). ";
		cin >> choice;
	} while (choice == 'y');
}

//subprogram a -- return new Array initialized to 0
int* makeArray(int size) {

	int* newArray = new int[size];
	*newArray = -1;
	*(newArray + 1) = -1;

	int* start = newArray + 2;
	int* end = newArray + size;
	while (start < end) {
		*start = 0;
		++start;
	}
	return newArray;
}

//subprogram b -- find the first element that has a zero (is unknown)
int containsZero(int myArray[], int size) {
	int* start = myArray;
	int* end = myArray + size;
	while (start < end) {
		if (*start == 0) {
			return start - myArray;
		}
		++start;
	}
}

//subprogram c -- mark as 1 (circle) the specfied factor element
//				-- cross out all mutiples of the factor
//				-- use recursion with subprogram b to do it again
//				-- once the square root of the size is smaller than the factor, call subprogram d
void arrayFactor(int myArray[], int size, int factor) {
	int* start = myArray + factor;
	int* end = myArray + size;

	*start = 1;

	if (isGreaterThan(factor, size)) {
		circleZero(myArray, size);
	}
	else {
		while (start < end) {
			start = start + factor;

			if (start < end) {
				*start = -1;
			}
		}
		arrayFactor(myArray, size, containsZero(myArray, size));
	}
}

//subprogram d -- turn all zeroes (unkowns) into 1s (prime)
void circleZero(int myArray[], int size) {
	int* start = myArray;
	int* end = myArray + size;

	while (start < end) {
		if (*start == 0) {
			*start = 1;
		}
		++start;
	}
}

//subprogram e -- make final array containing only the prime numbers
int* finalArray(int myArray[], int& size) {
	int newSize = 0;
	int* start = myArray;
	int* end = myArray + size;

	while (start < end) {
		if (*start == 1) {
			newSize++;
		}
			++start;
	}

	int* newArray = new int[newSize];
	int* newStart = newArray;

	start = myArray;

	while (start < end) {
		if (*start == 1) {
			*newStart = start - myArray;
			++newStart;
		}
		++start;
	}

	size = newSize;

	return newArray;
}


//subprogram to determine if a factor is greater than the
//square root of the highest specified integer
int isGreaterThan(int factor, int highest) {
	return (factor > pow(highest, (1.0 / 2.0)));
}