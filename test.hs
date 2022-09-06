double x = 2 * x
plusThree x = x + 3

myFunc x = double $ plusThree x

skipSecond (x:y:xs) = y : skipSecond xs
skipSecond _ = []