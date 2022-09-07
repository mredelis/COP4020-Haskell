-- Haskell - Recursion and Type Classes 

-- 1. (33 pts) Create a function named problem1. Use a list comprehension for the main function. 
-- This function will take a single integer parameter. It indicates the number of primes that will be the final list. 
-- The final solution will output a list of every other prime.
-- problem1 10 --> [2,5,11,17,23,31,41,47,59,67]
-- problem1 7 --> [2,5,11,17,23,31,41]

-- Helper functions
skipEveryOtherPrime (x:y:xs) = y : skipEveryOtherPrime xs
skipEveryOtherPrime _ = []

-- From the slides
isPrime n = ip n [2..(n `div` 2)]
    where
    ip _ [] = True
    ip n (x:xs)
        | n `mod` x == 0 = False
        | otherwise = ip n xs

problem1 n = skipEveryOtherPrime (take (2*n) [ x | x <- [1..], isPrime x])


-- 2. (33 pts) Create a function named problem2. Use recursion to solve this problem. 
-- This function will take a single integer parameter. It indicates the maximum value of Fibonacci numbers that will be in the list. 
-- The final solution will be a list of Fibonacci numbers that have a three as their right-most digit and are less than or equal to n. 
-- (For this problem, Fibonacci starts 1,1,2,…)
-- problem2 100 --> [3,13]
-- problem2 10000 --> [3,13,233]

problem2 n = go n 1 1
    where
    go n f s
        | (f+s) > n = []
        | (f+s) `mod` 10 == 3 = (f+s) : go n s (f+s) 
        | otherwise = go n s (f+s) 

-- 3. (34 pts) Create a function named problem3. For this problem, you can solve it any way you’d like. 
-- You may (and should) use helper functions. Create a list from numbers from 1 to n. 
-- The numbers must be either a multiple of five or have exactly three factors.
-- problem3 100 --> [4,5,9,10,15,20,25,30,35,40,45,49,50,55,60,65,70,75,80,85,90,95,100]

problem3 n = [ x | x <- [1..n], (x `mod` 5 == 0) || (length (factors x) == 3) ]
    where
    factors n = [ x | x <- [1..n], n `mod` x == 0]
