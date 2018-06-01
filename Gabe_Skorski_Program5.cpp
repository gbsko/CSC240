/*

Gabe Skorski 2/28/18 Program #5 - Letter Frequencies

This program prompts the user to input a file pathway to read text from that file.
The program then counts up how many times each letter happens in the text, and displays
a table of the letter counts and frequencies. And asks if they would like to go again.

*/


#include <fstream>
#include <iostream>
#include <iomanip>

using namespace std;

int getLine(char message[], int& messageSize);
char lowerCase(char c);
void counter(char message[], int letterCounter[], int counterSize, int& totalLetters);
void displayTable(int letterCounter[], int letterSize, int totalLetters);

//main
int main(){
	int letterCounter[26];
	int counterSize = 26;

	char message[501];
	int messageSize = 0;

	int totalLetters;
	char again = 'y';

	cout << "This program will read the text from a file and return the letter frequencies." << endl;

	while (again == 'y') {
		totalLetters = 0;
		getLine(message, messageSize);
		cout << endl << "---TEXT FROM FILE---" << endl;
		cout << endl << message << endl << endl;
		counter(message, letterCounter, counterSize, totalLetters);
		displayTable(letterCounter, counterSize, totalLetters);

		do {
			cout << endl << "Would you like to check another file?(y/n): ";
			cin >> again;
			again = lowerCase(again);
		} while (lowerCase(again) != 'n' && lowerCase(again) != 'y');
	}

	cout << endl << "Thanks for using the program!!!";
	return 0;
}

//a function that reads text from a file one character at a time and returns a string
int getLine(char message[], int& messageSize) {
	char fileName[129];
	fstream infile;
	int i;
	char c;

	cout << endl << "Enter the file pathway: ";
	cin >> fileName;

	infile.open(fileName, ios::in | ios::_Nocreate);
	if (infile.fail()) return 0;

	i = 0;
	c = ' ';

	while (!infile.eof())
	{
		c = infile.get();
			message[i] = c;
			++i;
			messageSize++;
	}
	message[i] = '\0';
	infile.close();
	return 1;
}

//a function that is given a string and an array of 26 character counters that computes how many times each letter appears in the string
void counter(char message[], int letterCounter[], int counterSize, int& totalLetters) {
	for (int i = 0; i < counterSize; i++) {
		letterCounter[i] = 0;
	}
	int index;
	int i = 0;
	char c = ' ';

	while (c != '\0') {
		c = lowerCase(message[i]);
		if (c >= 90 && c <= 122) {
			index = c - 'a';
			letterCounter[index]++;
			totalLetters++;
		}
		i++;
	}
}


//a function given a character that returns the lower-case version if it is upper case or the same character
char lowerCase(char c) {
	if (c >= 'A' && c <= 'Z') {
		c = c + 32;
	}
	return c;
}

//a function given an array of character counters that displays the contents in a table
void displayTable(int letterCounter[], int counterSize, int totalLetters) {
	char c = ' ';
	double frequency = 0.0;
	cout << "----LETTER FREQUENCIES----" << "Total letters: " << totalLetters << endl << endl;
	cout << "letter" << "	" << "count" << "	" << "frequency" << endl;

	for (int i = 0; i < counterSize; i++) {
		c = (char)('a' + i);
		if (c == 'n') {
			cout << endl << "For the next 13 letters press any key and hit enter: " ;
			char moreLetters;
			cin >> moreLetters;
			cout << endl << "letter" << "	" << "count" << "	" << "frequency" << endl;
		}
		
		frequency = ((double)letterCounter[i]/(double)totalLetters)*100;
		cout << "  " << c << "	  " << letterCounter[i] << "	  " << setprecision(1) << fixed << frequency << "%" <<  endl;
	}
}