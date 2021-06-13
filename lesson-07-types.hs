module Main where

main = putStrLn "Hello, World!"

-- types

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase string = [char | char <- string, char `elem` ['A' .. 'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z
