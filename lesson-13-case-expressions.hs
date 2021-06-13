module Main where

main = putStrLn "Hello, World!"

-- case expressions

myHead :: [a] -> a
myHead a = case a of
  [] -> error "Empty list"
  (x : _) -> x

describeList :: [a] -> String
describeList xs =
  "The list is " ++ case xs of
    [] -> "empty."
    [x] -> "a singleton list."
    xs -> "a longer list."

whereDescribeList :: [a] -> String
whereDescribeList xs = "The list is " ++ what xs
  where
    what [] = "empty."
    what [x] = "a singleton list."
    what xs = "a longer list."