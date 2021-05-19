#include <stdio.h>
#include <stdlib.h>

main()
{
    int num1, num2, maior;

    printf("Digite o primeiro numero \n");
    scanf("%d", &num1);

    printf("Digite o segundo numero \n");
    scanf("%d", &num2);

    maior = num1 > num2 ? num1 : num2;
    
    printf("O Maior numero eh: %d\n", maior);
}