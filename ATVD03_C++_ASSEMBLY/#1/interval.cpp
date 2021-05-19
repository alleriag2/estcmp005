#include <iostream>

using namespace std;


int main() 
{
    int num1, num2 = 0;

    cout << "Digite o primeiro numero:" << endl;
    cin >> num1;
    cout << "Digite o segundo numero:" << endl;
    cin >> num2;

    cout << "Os numeros entre " << num1 << " e " << num2 << " sao: "<< endl;
    if (num1 < num2) 
    {
        for (int i = num1 + 1; i < num2; i++)
        {
            cout << i << endl;
        }
    }else{
        cout << "Intervalo invalido" << endl;
    }
    

    return 0;
}