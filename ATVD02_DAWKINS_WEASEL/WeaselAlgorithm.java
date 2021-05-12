import java.util.Arrays;
import java.util.Random;

public class WeaselAlgorithm {
    public static final String target = "METHINKS IT IS LIKE A WEASEL";
    public static final String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ ";

    public static int MUTATION_PROB = 5;
    public static int SIZE = 100;
    public static int TARGET_SIZE = target.length();

    final static Random random = new Random();

    public static String generateRandomString() {
        String randomString = "";

        for (int i = 0; i < TARGET_SIZE; i++) {
            randomString += letters.charAt(random.nextInt(letters.length()));
        }

        return randomString;
    }

    public static String mutate(String evoStr)
    {
        char[] evoCharArray = evoStr.toCharArray();
        for (int i = 0; i < TARGET_SIZE; i++) {
            if (random.nextInt(101) <= MUTATION_PROB) {
                evoCharArray[i] = letters.charAt(random.nextInt(letters.length()));
            }
        }
        return evoStr = String.valueOf(evoCharArray);
    }

    public static int comparison(String evoStr) {
        char[] evoCharArray = evoStr.toCharArray();
        char[] targetCharArray = target.toCharArray();
        int score = 0;

        for (int i= 0; i < TARGET_SIZE; i++) { 
            if (evoCharArray[i] == targetCharArray[i]) {
                score++;
            }
        }

        return score;
    }

    public static String reproduce(String evoStr) {
        String evoStrCopy;
        String highestScore = evoStr;
        for (int i= 0; i < SIZE; i++) {
            evoStrCopy = mutate(evoStr);
            if (comparison(evoStrCopy) > comparison(highestScore)) {
                highestScore = evoStrCopy;
            }
        }
        return highestScore;
    }

    public static void main(String[] args) {
        int tries = 0;
        String evolutionString = generateRandomString();

        do{
            tries++;
            evolutionString = reproduce(evolutionString);
            System.out.println("Tentativa "+ tries+": "+evolutionString+" score: "+ comparison(evolutionString));
        }while(evolutionString == target);
        System.out.println("O Algoritmo de Weasel levou "+tries+"gerações para conseguir reproduzir a frase!");
    }
}