module Main where

main = putStrLn "Hello, World!"

calculateBmi :: (RealFloat a) => a -> a -> a
calculateBmi weight height = weight / height ^ 2

evaluateBmi :: (RealFloat a) => a -> a -> String
evaluateBmi weight height
  | calculateBmi weight height <= 18.5 = "You're underweight"
  | calculateBmi weight height <= 25.0 = "You're normal weight"
  | calculateBmi weight height <= 30.0 = "You're overweight"
  | otherwise = "You're obese"

myMax :: (Ord p) => p -> p -> p
myMax a b
  | a > b = a
  | otherwise = b

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a > b = GT
  | a < b = LT
  | otherwise = EQ