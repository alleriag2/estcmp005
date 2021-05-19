#include <iostream>

using namespace std;

int main()
{ 
    float fahrenheit, celsius;
    cout << "Insira a temperatura em Fahrenheit" << endl;
    cin >> fahrenheit;
    
    celsius = (fahrenheit - 32) * 5/9;

    cout << "A temperatura em celsius eh: " << celsius << endl;
}
