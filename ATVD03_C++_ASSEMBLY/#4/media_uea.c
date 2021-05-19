#include <stdio.h>

int main()
{
    float ap1, ap2, final;

    printf("Digite sua nota na AP1: \n");
    scanf("%f", &ap1);

    printf("Digite sua nota na AP2: \n");
    scanf("%f", &ap2);

    if ( (ap1 + ap2)/2 >= 8) {
        printf("Parabens voce passou direto com media: %.1f", (ap1+ap2)/2);
    }else
    {
        printf("Adicione a nota da final\n");
        scanf("%f", &final);

        float media = (ap1+ap2+final)/3;

        printf("Sua media eh: %.1f", media);
    }
}
