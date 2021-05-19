#include <iostream>

using namespace std;

int main()
{
    float ap1, ap2, final;

    cout << "Digite sua nota na AP1:" << endl;
    cin >> ap1;

    cout << "Digite sua nota na AP2: "<< endl;
    cin >> ap2;

    if ( (ap1 + ap2)/2 >= 8)
    {
        cout << "Parabens voce passou direto com media: %.1f" << (ap1 + ap2) / 2 << endl;
    }
    else
    {
        cout << "Adicione a nota da final\n" << endl;
        cin >> final;

        float media = (ap1 + ap2 + final)/3;

        cout <<"Sua media eh: %.1f" << media << endl;
    }