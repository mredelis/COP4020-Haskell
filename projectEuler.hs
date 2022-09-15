{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

-- 1. Multiple of 3 or 5
-- If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
-- Find the sum of all the multiples of 3 or 5 below 1000.

sumOfMult n = sum [x | x <- [1 .. (n -1)], x `mod` 3 == 0 || x `mod` 5 == 0]

-- 2. Even Fib Numbers
-- Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
-- 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
-- By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

listFib n = go n 1 1
  where
    go n f s
      | (f + s) > n = []
      | otherwise = if even (f + s) then (f + s) : go n s (f + s) else go n s (f + s)

-- 3. Largest Prime Factor
-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143 ? -Don't try this. Will never end LOL
-- Reuse isPrime function from slides
isPrime n = ip n [2 .. (n `div` 2)]
  where
    ip _ [] = True
    ip n (x : xs)
      | n `mod` x == 0 = False
      | otherwise = ip n xs

-- factors n = [x | x <- [1 .. n], n `mod` x == 0]
largestPrimeFactor n = maximum [x | x <- [1 .. n], isPrime x, n `mod` x == 0]

-- 4. Largest Palindrome Product
-- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
-- Find the largest palindrome made from the product of two 3-digit numbers.
isPalindrome x = show x == reverse (show x)
largestPalindrome = maximum [x * y | x <- [1 .. 999], y <- [1 .. 999], isPalindrome (x * y)]

-- 5. Smallest multiple
-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
-- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

isDivisibleBy1ToN number n = go number [1 .. n]
  where
    go number (x : xs)
      | null xs = True
      | number `mod` x /= 0 = False
      | otherwise = go number xs

-- Smallest number divisible by 1..n
smallest n = go n 1
  where
    go n i
      | isDivisibleBy1ToN i n = i
      | otherwise = go n (i + 1)

-- 6. Sum of Square Difference
-- 6. Sum of Square Difference. 
sumOfSquares n = sum [x^2 | x<-[1..n]]
squareOfSums n = (sum [ x | x<-[1..n]])^2

difference n = squareOfSums n - sumOfSquares n

-- 7.
-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
-- What is the 10 001st prime number?
nthPrimeNumber n = [ x | x <-[1..], isPrime x] !! n


-- 8. Largest product in a series
-- The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.
-- Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
thousandDigitNum = "73167176531330624919225119674426574742355349194934\
\96983520312774506326239578318016984801869478851843\
\85861560789112949495459501737958331952853208805511\
\12540698747158523863050715693290963295227443043557\
\66896648950445244523161731856403098711121722383113\
\62229893423380308135336276614282806444486645238749\
\30358907296290491560440772390713810515859307960866\
\70172427121883998797908792274921901699720888093776\
\65727333001053367881220235421809751254540594752243\
\52584907711670556013604839586446706324415722155397\
\53697817977846174064955149290862569321978468622482\
\83972241375657056057490261407972968652414535100474\
\82166370484403199890008895243450658541227588666881\
\16427171479924442928230863465674813919123162824586\
\17866458359124566529476545682848912883142607690042\
\24219022671055626321111109370544217506941658960408\
\07198403850962455444362981230987879927244284909188\
\84580156166097919133875499200524063689912560717606\
\05886116467109405077541002256983155200055935729725\
\71636269561882670428252483600823257530420752963450"

-- this is the main function that takes the number of adjacent digits and returns the largest product
greatestProduct n = maximum [product (take n (drop x (map digitToInt thousandDigitNum))) | x <- [0..(length thousandDigitNum - n)]]

-- This helper function takes the ASCII value of a character and converts it to an integer value
digitToInt c = fromEnum c - fromEnum '0'



-- 9. 
-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a^2 + b^2 = c^2
-- For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product abc.

pitagoreanTriple = [(a, b, c) | c <- [1 .. 1000], b <- [1 .. c], a <- [1 .. b], a^2 + b^2 == c^2, a + b + c == 1000]
-- result [(200,375,425)]

-- this will take forever, but it works. Don't try it. System will run out of application mem
pitagoreanTripleProduct [(a, b, c)] = a * b * c

-- 10.
-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
-- Find the sum of all the primes below two million.
sumOfPrimesBelowN n = sum [ x| x<-[2..(n-1)], isPrime x]

-- 12.
-- The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. 
-- The first ten terms would be: 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
-- Let us list the factors of the first seven triangle numbers:
--      1: 1
--      3: 1,3
--      6: 1,2,3,6
--     10: 1,2,5,10
--     15: 1,3,5,15
--     21: 1,3,7,21
--     28: 1,2,4,7,14,28
-- We can see that 28 is the first triangle number to have over five divisors.
-- What is the value of the first triangle number to have over five hundred divisors?

-- 1 1
-- 2 1+2 = 3
-- 3 1+2+3 = 6
-- 4 1+2+3+4 = 10
-- 5 1+2+3+4+5 = 15
-- 6 1+2+3+4+5+6 = 21
-- 7 1+2+3+4+5+6+7 = 28

triangleNumberN n = sum [ x | x<-[1..n]] -- it can be written recursively as well
factors n = [ x | x<-[1..n], n `mod` x == 0] -- can be also written recursively
numberOfDivisors n = length (factors n)

triangleNumberWithNFactors f = go 1 f
  where
    go c f -- c-counter / f-factor number
     | numberOfDivisors (triangleNumberN c) > f = triangleNumberN c
     | otherwise = go (c+1) f


-- 14
-- The following iterative sequence is defined for the set of positive integers:
-- n → n/2 (n is even)
-- n → 3n + 1 (n is odd)
-- Using the rule above and starting with 13, we generate the following sequence:
-- 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
-- It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. 
-- Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
-- Class Q: for all starting numbers between 1 and 100, how many chains have a length greater than 15?

chain 1 = [1]
chain n
 | even n = n : chain (n `div`2)
 | odd n = n : chain (3*n + 1)

isLong xs = length xs > 15

-- it will generate a list of all starting # that generate a chain longer than 15
-- if we do the length, then it will spit out how many #s meet this condition 
numLongChains n = length (go n 1)
  where
    go n c
     | c > n = []
     | isLong (chain c) = c : go n (c+1)
     | otherwise = go n (c+1)


-- 15 Power digit sum
-- 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
-- What is the sum of the digits of the number 2^1000? I would create a generic function

--Convert the char value of a number to a number
charValue c = fromEnum c - 48

powerDigitSum n = go (show(2^n))
  where
    go (x:xs)
     | null xs = charValue x
     | otherwise = charValue x + go xs



-- 92. Square digit chains
-- A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.
-- For example,
-- 44 → 32 → 13 → 10 → 1 → 1
-- 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
-- Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. 
-- What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.
-- How many starting numbers below ten million will arrive at 89?

squareADigit c = (fromEnum c - 48)^2
processDigits xs = sum [squareADigit x | x <- xs]
squareDigits n = processDigits (show n)

generateSequence n 
  | n == 1 = 1
  | n == 89 = 89
  | otherwise = generateSequence (squareDigits n)

count89s n = length [x | x <- [1 .. (n -1)], generateSequence x == 89]

-- 125 Palindromic Sums
-- The palindromic number 595 is interesting because it can be written as the sum of consecutive squares: 6^2 + 7^2 + 8^2 + 9^2 + 10^2 + 11^2 + 12^2.
-- There are exactly eleven palindromes below one-thousand that can be written as consecutive square sums, and the sum of these palindromes is 4164. 
-- Note that 1 = 0^2 + 1^2 has not been included as this problem is concerned with the squares of positive integers.
-- Find the sum of all the numbers less than 108 that are both palindromic and can be written as the sum of consecutive squares.

-- isPalindrome n = show n == reverse (show n) Already declared

-- Find if number n is the sum of consecutive squares
  -- isSumOfConsecutiveSquares n = isocs n 1 0
  --   where
  --   isocs n i c
  --     | c > n = False
  --     | c == n = True
  --     | otherwise = isocs n (i+1) (c+i*i)

-- 50. Consecutive prime sum
-- The prime 41, can be written as the sum of six consecutive primes:
-- 41 = 2 + 3 + 5 + 7 + 11 + 13
-- This is the longest sum of consecutive primes that adds to a prime below one-hundred.
-- The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
-- Which prime, below one-million, can be written as the sum of the most consecutive primes?

-- List of prime #s below n
listOfPrimes n = [x | x<- [2..(n-1)], isPrime x]




-- 142 How many reversible numbers are there below one-billion?
-- Some positive integers n have the property that the sum [ n + reverse(n) ] consists entirely of odd (decimal) digits. 
-- For instance, 36 + 63 = 99 and 409 + 904 = 1313. We will call such numbers reversible; so 36, 63, 409, and 904 are reversible.
-- Leading zeroes are not allowed in either n or reverse(n). There are 120 reversible numbers below one-thousand.
-- How many reversible numbers are there below one-billion?

sumOfReverse n = n + read (reverse (show n))

allDigitsOdd n = go (show n)
  where
    go (x : xs)
      | even (charValue x) = False
      | null xs = True
      | otherwise = go xs

-- lastDigitZero n = last (show n) == '0' -- Used mod instead

howManyRevs n = length [x | x <- [1 .. (n -1)], allDigitsOdd (sumOfReverse x) && x `mod` 10 /= 0]

