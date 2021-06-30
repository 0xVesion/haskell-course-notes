module Main where

import Data.Char

main = putStrLn "Hello, World!"

-- Data.Char exports various char predicates. For example: isLower, isUpper, 
-- isSpace etc.
-- These predicates can be useful in comparisons. 
-- For example: all isAlphaNum "Hello World!" -> False

-- generalCategory returns the GeneralCategory value for a given char. 
-- For example: generalCategory 'A' -> UppercaseLetter

-- ord returns the unicode number for the given char
-- chr returns the char for the given unicode number

caesarCipher :: String -> String
caesarCipher = map (\c -> chr (ord c + 10))

uncaesarCipher :: String -> String
uncaesarCipher = map (\c -> chr (ord c - 10))