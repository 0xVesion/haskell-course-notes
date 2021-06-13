module Main where

main = putStrLn "Hello, World!"

-- pattern matching

lucky :: (Integral a) => a -> String
lucky 7 = "Super Lucky!"
lucky x = "Not that lucky"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

fac :: (Integral x) => x -> x
fac 0 = 1
fac x = x * fac (x - 1)

-- We should always include a catch all pattern

-- Pattern matching can be used to destructure lists and tuples

addVectors :: (Num x, Num y) => (x, y) -> (x, y) -> (x, y)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

first :: (a, b, c) -> a
first (a, _, _) = a

second :: (a, b, c) -> b
second (_, b, _) = b

third :: (a, b, c) -> c
third (_, _, c) = c

-- Pattern matching can also be used in list comprehensions
listComprehension =
  [ a + b
    | (a, b) <- [(1, 2), (2, 3), (3, 4)],
      a + b >= 5
  ]

patm1 :: Num a => [a] -> a
patm1 [a, b, c] = a + b + c

-- This is an alternative way to do patern matching on lists. The last matched
-- element would contain all other elements, but we ignore it in this example.
patm2 :: Num a => [a] -> a
patm2 (a : b : c : _) = a + b + c

-- [x] matches a list with exactly one element
-- (x : _) matches a list with 1 or more elements
myHead :: Show a => [a] -> String
myHead [] = "The list is empty!"
myHead [x] = show x
myHead (x : _) = show x ++ " ps.: the list contains additional elements"

myLength :: (Num b) => [a] -> b
myLength [] = 0
myLength (_ : rest) = 1 + myLength rest

mySum :: (Num x) => [x] -> x
mySum [] = 0
mySum (element : rest) = element + mySum rest

-- as patterns
-- as patterns capture the thing that has been destructured by pattern matching
capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x : xs) = "The first letter of " ++ all ++ " is " ++ [x]