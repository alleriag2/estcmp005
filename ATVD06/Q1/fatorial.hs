fatorial n = product[1..n] 

main = do
    putStrLn "Digite um numero para saber seu fatorial"
    num <- readLn
    print (fatorial num)