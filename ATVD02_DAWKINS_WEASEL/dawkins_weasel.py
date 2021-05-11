#Implementação do Richard Dawkins's weasel program
#Feito por Karla Félix para a disciplina de Paradigmas de Linguagem de Programação
#Turma ESTCMP005 2020-2

import random
import string

CONST_TARGET = list("METHINKS IT IS LIKE A WEASEL")  # String alvo
SIZE = range(100) #Numero de vezes que a string vai ser gerada
PROB = 0.05 #Porcentagem de probabilidade de mutação
LETTERS = string.ascii_uppercase + ' '

highestScoreStr = []

def generateRandomString():
    evoStr = []
    for _ in range(0, len(CONST_TARGET)):
        evoStr.append(random.choice(LETTERS))
    return evoStr

def mutate(evoStr):
    # gera um novo caracter para cara um dos caracteres de cada uma das 100 cópias
    return [(random.choice(LETTERS) if random.random() < PROB else evoChar) for evoChar in evoStr]

def comparison(evoStr):
    score = 0
    if len(evoStr) != 0:
        for i in range (0, len(CONST_TARGET)):
            if CONST_TARGET[i] == evoStr[i]:
                score += 1
                
    return score

def reproduce(evoStr, tries):
    global highestScoreStr
    for _ in SIZE:
        evoStrCopy = mutate(evoStr)
        score = comparison(evoStrCopy)
        if score > comparison(highestScoreStr):
            highestScoreStr = evoStrCopy
        tries += 1
        print(f"Tentativa {tries}: {''.join(highestScoreStr)} -- Score: {score}")
    return highestScoreStr, tries

def main():
    tries = 0
    print("Made by Karla Felix")
    evolutionString = generateRandomString()
    while evolutionString != CONST_TARGET:
        evolutionString, tries = reproduce(evolutionString, tries)
        print(f"Evolution String == {''.join(evolutionString)} tentativa {tries}")
    else:
        print(f"O algortimo de Weasel levou {tries} tentativas para conseguir o reproduzir a frase!")

main()
