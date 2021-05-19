#include <iostream>

using namespace std;

int main()
{
    int num1, num2 = 0;

    cout << "Insira dois numeros a sua escolha:" << endl;
    cin >> num1;
	cin >> num2;

    int maior = num1 > num2 ? num1 : num2;
    cout << "O maior numero eh: "<< maior << endl;
}
