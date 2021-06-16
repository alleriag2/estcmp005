sequencia x y = reverse $ until ((==x) . head) (\y -> head y+1 : y) [y]
main = do
    putStrLn "Digite o tamanho da lista e seu primeiro numero"
    x <- readLn
    y <- readLn
    print (sequencia x y)