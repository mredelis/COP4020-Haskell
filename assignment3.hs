-- Haskell - Higher Order Functions and Modules

-- 1. Using map, double the numbers in this list: [1,5,-18,99]
problem1 = map (^ 2) [1, 5, -18, 99]

-- 2. Using filter extract all the even numbers in this list: [1..100]
problem2 = filter even [1..100]

-- 3. Using map multiple all numbers in this list: [1,3..77] by 3.
problem3 = map (* 3) [1, 3 .. 77]

-- 4. Using any functions you choose (but map and filter might be good choices) calculate 
-- the sum of the squares of all odd numbers in this list: [1,2,3,4,5,7,8,1,43,25,65,22]
problem4 = sum (map (^2) (filter odd [1, 2, 3, 4, 5, 7, 8, 1, 43, 25, 65, 22]))
