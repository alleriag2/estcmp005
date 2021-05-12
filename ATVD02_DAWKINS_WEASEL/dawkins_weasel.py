#Implementação do Richard Dawkins's weasel program
#Feito por Karla Félix para a disciplina de Paradigmas de Linguagem de Programação
#Turma ESTCMP005 2020-2

import random
import string
import sys

CONST_TARGET = list("METHINKS IT IS LIKE A WEASEL")  # String alvo
TARGET_LEN = len(CONST_TARGET)
SIZE = range(100) #Numero de vezes que a string vai ser gerada
PROB = 0.05 #Porcentagem de probabilidade de mutação
LETTERS = string.ascii_uppercase + ' '

highestScoreStr = []


def generateRandomString():
    evoStr = []
    for _ in range(TARGET_LEN):
        evoStr.append(random.choice(LETTERS))
    return evoStr

def mutate(evoStr):
    # gera um novo caracter para cara um dos caracteres de cada uma das 100 cópias
    return [(random.choice(LETTERS) if random.random() < PROB else evoChar) for evoChar in evoStr]

def comparison(evoStr):
    score = 0
    if len(evoStr) != 0:
        for i in range (TARGET_LEN):
            if CONST_TARGET[i] == evoStr[i]:
                score += 1
                
    return score

def reproduce(evoStr):
    global highestScoreStr
    for _ in SIZE:
        evoStrCopy = mutate(evoStr)
        score = comparison(evoStrCopy)
        if score > comparison(highestScoreStr):
            highestScoreStr = evoStrCopy
        
    return highestScoreStr, comparison(highestScoreStr)

def main():
    tries, score = 0, 0
    evolutionString = generateRandomString()
    while evolutionString != CONST_TARGET:
        tries += 1
        evolutionString, score = reproduce(evolutionString)
        print(f"Tentativa {tries}: {''.join(highestScoreStr)} -- Score: {score}")
    else:
        print(f"O algortimo de Weasel levou {tries} gerações para conseguir o reproduzir a frase!")

main()
