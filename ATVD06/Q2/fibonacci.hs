fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2) 

main = do 
    putStrLn "Digite um numero para saber qual seria seu próximo na sequencia de Fibonacci"
    n <- readLn
    print(fibonacci n)