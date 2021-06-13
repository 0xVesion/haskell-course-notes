module Main where

main = putStrLn "Hello, World!"

-- if
doubleSmallNumber x =
  if x > 100
    then x
    else x * 2

doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1 -- ' at the end of a function denotes a more strict version

conanO'Brien = "It's a-me, Conan O'Brien!" -- functions which don't receive any arguments are fundamentally the same as constants
