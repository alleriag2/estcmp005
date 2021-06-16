l1 = [1, 2, 3, 4, 5]
l2 = [8, 8, 8]

--Implementation of ZIP function with some changes
intercala xs [] = l1
intercala [] ys = l2
intercala (x:xs) (y:ys) = x : y : intercala xs ys 

main = do print(intercala l1 l2)