-- Edelis Molina

-- 1. Create a function that multiplies two numbers
multTwo x y = x * y

-- 2. Create a function that multiplies three numbers
multThree x y z = x * y * z

-- 3. Create a function named first_a that uses a list comprehension. The function will take a single integer parameter n. 
-- Find every number from 1 to n (inclusive) that is a multiple of 6 or a multiple of 11. Do not use a helper function.
firstA n = [x | x <- [1 .. n], mod x 6 == 0 || mod x 11 == 0]

-- 4. Create a function named first_b that does the same as the function from #3 above, but uses a helper function named isMult6Or11.
isMult6Or11 x = x `mod` 6 == 00 || x `mod` 11 == 0
firstB n = [x | x <- [1 .. n], isMult6Or11 x ]

-- 5. Create a function named second_a that uses a list comprehension. The function will take a single integer parameter n. 
-- Find every number from 1 to n (inclusive) that is a palindrome which starts with the digit 3. Do not user a helper function.
secondA n = [x | x <- [1..n], head(show x) == '3' && show x == reverse(show x)]

-- 6. Create a function named second_b that does the same as the function from #5 above, 
-- but uses a helper function named isPalindromeThatStartsWithDigit3.
isPalindromeThatStartsWithDigit3 x = head (show x) == '3' && show x == reverse (show x)
secondB n = [x | x <- [1..n], isPalindromeThatStartsWithDigit3 x]

