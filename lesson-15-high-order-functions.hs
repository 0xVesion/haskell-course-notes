module Main where

main = putStrLn "Hello, World!"

-- high order functions

-- All functions in Haskell only take one argument. Funtions with multiple
-- arguments simply return a function which takes the next argument. Function
-- types like `multThree :: (Num a) => a -> a -> a -> a` can also be read as
-- `multThree :: (Num a) => a -> (a -> (a -> a))`. Putting a space between two
-- things is simply applying a function.

multTwo :: (Num a) => a -> a -> a
multTwo x y = x * y

-- Calling a function with too few arguments creates a new function on the fly
-- This is called partial function application. The resulting functions can
-- also be assigned to a name
yumCurry :: Integer
yumCurry = multByNine 10
  where
    multByNine = multTwo 9

compareToPi :: (Ord a, Fractional a) => a -> Ordering
compareToPi = compare 3.14159

-- Infix functions can also be partially appliead by sectioning of one of their
-- operands with braces.
divideByTen :: (Floating a) => a -> a
divideByTen = (/ 10)

isUppercase :: Char -> Bool
isUppercase = (`elem` ['A' .. 'Z'])

applyTwice :: (a -> a) -> a -> a
applyTwice fun x = fun (fun x)

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f (a : as) (b : bs) = f a b : myZipWith f as bs