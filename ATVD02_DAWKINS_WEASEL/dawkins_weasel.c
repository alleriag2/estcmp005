#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char target[] = "METHINKS IT IS LIKE A WEASEL";//target 
const char letters[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ ";//letras do alfabeto e espaço em branco

#define TARGET_SIZE strlen(target)
#define SIZE 100
#define MUTATION_PROB 5

/* retorna um inteiro aleatorio */
int irand(int n)
{
    int r, rand_max = RAND_MAX - (RAND_MAX % n);
    while ((r = rand()) >= rand_max);
    return r / (rand_max / n);
}

char *reproduce(char *evoStr)
{
    char *evoStrCopy = malloc(TARGET_SIZE * sizeof(char));
    char *highestScore = (char *)malloc(TARGET_SIZE * sizeof(char));
    int score = 0;
    int cont = 0;

    for (int i = 0; i < SIZE; i++)
    {
        strncpy(evoStrCopy, evoStr, TARGET_SIZE);
        //mutate
        for (int i = 0; i < TARGET_SIZE; i++)
        {
            if (irand(100) <= MUTATION_PROB)
            {
                evoStrCopy[i] = letters[irand(TARGET_SIZE)];
            }
        }
        score = comparison(evoStrCopy);
        if (score > comparison(highestScore))
        {
            strncpy(highestScore, evoStrCopy, TARGET_SIZE);
        }
    }

    return highestScore;
}

int comparison(char *evoStr)
{
    int score = 0;
    for (int i = 0; i < TARGET_SIZE; i++)
    {
        if (target[i] == evoStr[i])
        {
            score++;
        }
    }
    return score;
}

int main()
{
    int tries = 0;
    char *evolutionString = (char *)malloc(TARGET_SIZE * sizeof(char));

    /*Random String*/
    for (int i = 0; target[i]; i++)
    {
        evolutionString[i] = letters[irand(TARGET_SIZE)];
    }
    int cont = 0;
    do
    {
        evolutionString = reproduce(evolutionString);
        tries++;
        printf("Tentativa %d : %s score: %d \n", tries, evolutionString, comparison(evolutionString));
    } while (comparison(evolutionString) != TARGET_SIZE);
    printf("O Algortimo de Weasel levou %d tentativas para reproduzir a frase!");
    return 0;
}
