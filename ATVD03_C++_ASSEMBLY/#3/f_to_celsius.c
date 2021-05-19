#include <stdio.h>

int main(void)
{
    float celsius, fahrenheit;

    printf("Fahrenheit = ");
    scanf("%f", &fahrenheit);

    celsius = (fahrenheit - 32) * 5 / 9;

    printf("C = %f", celsius);

    return (0);
}