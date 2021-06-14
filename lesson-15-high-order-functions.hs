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
myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f (a : as) (b : bs) = f a b : myZipWith f as bs

myFlip :: (a -> b -> c) -> (b -> a -> c)
myFlip f a b = f b a

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap fun (el : rest) = fun el : myMap fun rest

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter predicate (x : xs)
  | predicate x = x : myFilter predicate xs
  | otherwise = myFilter predicate xs

myShorterQuickSort :: (Ord a) => [a] -> [a]
myShorterQuickSort [] = []
myShorterQuickSort (x : xs) = smallerNumbers ++ [x] ++ largerNumbers
  where
    smallerNumbers = myShorterQuickSort (filter (< x) xs)
    largerNumbers = myShorterQuickSort (filter (> x) xs)

largNum :: (Integral a) => a
largNum = head (filter isDivisible [100000, 99999 ..])
  where
    isDivisible x = (x `mod` 3829) == 0

oddSquares :: (Integral a) => a
oddSquares =
  sum
    ( takeWhile
        (< 10000)
        ( filter
            odd
            ( map (^ 2) [1 ..]
            )
        )
    )

oddSquaresLc :: (Integral a) => a
oddSquaresLc = sum (takeWhile (< 10000) ([x | a <- [1 ..], let x = a ^ 2, odd x]))

collatzSequence :: (Integral a) => a -> [a]
collatzSequence 1 = [1]
collatzSequence x
  | even x = x : collatzSequence (x `div` 2)
  | otherwise = x : collatzSequence (x * 3 + 1)

collatzSequenceTest :: Int
collatzSequenceTest =
  length
    ( filter
        (> 15)
        ( map
            (length . collatzSequence)
            [1 .. 100]
        )
    )

mySum :: (Foldable t, Num b) => t b -> b
mySum = foldl (+) 0


myElem :: (Foldable t, Eq a) => a -> t a -> Bool
myElem y = foldl (\acc x -> if x == y then True else acc) False

myMap2 :: Foldable t1 => (t2 -> a) -> t1 t2 -> [a]
myMap2 fun = foldr (\x acc -> (fun x) : acc) []