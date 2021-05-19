#include <stdio.h>

int main()
{
    int num1, num2 = 0;

    printf("Digite o primeiro numero: \n");
    scanf("%d", &num1);
    printf("Digite o segundo numero:\n");
    scanf("%d", &num2);

    printf("Os numeros entre %d e %d sao: \n", num1, num2);
    if (num1 < num2)
    {
        for (int i = num1 + 1; i < num2; i++)
        {
            printf("%d \n", i);
        }
    }
    else
    {
        printf("Intervalo invalido \n");
    }

    return 0;
}