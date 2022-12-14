-- ctrl + L to clear terminal
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

isPalindrome x = show x == reverse (show x)

-- Define a function spaces n which returns a string of n spaces.
spaces n = [' ' | _ <- [1 .. n]]

-- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
-- Find the largest palindrome made from the product of two 3-digit numbers.
largest = maximum [x * y | x <- [1 .. 999], y <- [1 .. 999], isPalindrome (x * y)]

--Recursion
count 100 = []
count n = n : count (n + 1)

--Fibonacci
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

--List of n Fib Numbers
listFib n = [fib x | x <- [1 .. n]]

listFib' n = [(x, fib x) | x <- [1 .. n]]

--List of Fib Numbers below n
fibList n = go n 1 1
  where
    go n f s --first and second
      | (f + s) > n = []
      | otherwise = (f + s) : go n s (f + s)

--List of even Fib Numbers below n. Get the sum
evenFib n = sum (go n 1 1)
  where
    go n f s
      | (f + s) > n = []
      | otherwise = if even (f + s) then (f + s) : go n s (f + s) else go n s (f + s)

--Convert the char value of a number to a number
charValue c = fromEnum c - 48
-- 1. show n to convert to string
-- 2. reverse to reverse a string
-- 3. read to convert back to number


--Check if a number is Prime--

--Made by D' using the simplest concept of what a prime number is. However it won't work with 1
factors n = [x | x <- [1 .. n], n `mod` x == 0]

isPrimeD' n = factors n == [1, n]

--From the slides. The idea is to divide n by all factors from [2..(n-1)]
--If the remainder is 0, it means there's another factor other than 1 & n that divides n

--Version 1----------------------
-- isPrime n = ip n [2..(n-1)]
--   where
--   ip _[] = True --Base case
--   ip n (x:xs)
--     | n `mod` x == 0 = False
--     | otherwise = ip n xs
---------------------------------

--Version 2----------------------
isPrime n = ip n [2 .. (n `div` 2)]
  where
    ip _ [] = True
    ip n (x : xs)
      | n `mod` x == 0 = False
      | otherwise = ip n xs

---------------------------------

--Version 3----------------------
-- isPrime n = ip n [2..(isqrt(n-1) + 1)]
--  where
--   ip _ [] = True
--   ip n (x:xs)
--     | n `mod` x == 0 = False
--     | otherwise = ip n xs

-- isqrt :: Integral i => i -> i
-- isqrt = floor . sqrt . fromIntegral

--Not working. It doesn't generate 2
---------------------------------

--Generate a list of n Primes. Starts at 2 given that 1 is not a prime number
listPrimes n = take n ([x | x <- [2 ..], isPrime x])

--Skip every other element
skipSecond (x : y : xs) = y : skipSecond xs
skipSecond _ = []


-- Some positive integers n have the property that the sum [ n + reverse(n) ] consists entirely of odd (decimal) digits.
-- For instance, 36 + 63 = 99 and 409 + 904 = 1313. We will call such numbers reversible; so 36, 63, 409, and 904 are reversible.
-- Leading zeroes are not allowed in either n or reverse(n). There are 120 reversible numbers below one-thousand.

sumOfReverse n = n + read (reverse (show n))

allDigitsOdd n = go (show n)
  where
    go [] = True
    go (x : xs)
      | even (charValue x) = False
      | otherwise = go xs

lastDigitZero n = last (show n) == '0'

howManyRevs n = length [x | x <- [1 .. (n -1)], allDigitsOdd (sumOfReverse x) && not (lastDigitZero x)]

-- 1. The list goes up to (n-1) bc exercise says below n

listRevs n = [x | x <- [1 .. (n -1)], allDigitsOdd (sumOfReverse x) && not (lastDigitZero x)]

-- 60 is the smallest number that can be divided by each of the numbers from 1 to 5 without any remainder.
-- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 10?

isDivisibleBy1ToN v n = go v [1 .. n]
  where
    go v (x : xs)
      | null xs = True
      | v `mod` x /= 0 = False
      | otherwise = go v xs

smallest n = go n 1
  where
    go n v
      | isDivisibleBy1ToN v n = v
      | otherwise = go n (v + 1)

--smallest 10. Smallest positive number evenly divisble by 1..10

