
-- 2. (33 pts) Create a function named test1Problem2. Use recursion to solve this problem. This function
-- will take a single integer parameter. It indicates the maximum value of Fibonacci numbers that will be in the
-- list. The final solution will be a list of Fibonacci numbers that have a three as their right-most digit and are less
-- than or equal to n. (For this problem, Fibonacci starts 1,1,2,…). Fibonacci of 0 is 0.
-- test1Problem2 100 → [3,13]
-- test1Problem2 10000 → [3,13,233]

test1Problem2 n = go n 1 1
  where
    go n f s
      | (f + s) > n = []
      | (f + s) `mod` 10 == 3 = (f + s) : go n s (f + s)
      | otherwise = go n s (f + s)

-- 3. (34 pts) Create a function named test1Problem3. For this problem, you can solve it any way you’d like.
-- You may (and should) use helper functions. Create a list from numbers from 1 to n. The numbers must be
-- either a multiple of five or have exactly three factors. 
-- test1Problem3 100 →
-- [4,5,9,10,15,20,25,30,35,40,45,49,50,55,60,65,70,75,80,85,90,95,100]

factors n = [ x | x <- [1 .. n], n `mod` x == 0]

test1Problem3 n = [ x | x <- [1 .. n], (x `mod` 5 == 0) || (length (factors x) == 3)]
