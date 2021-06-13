module Main where

main = putStrLn "Hello, World!"

-- where bindings

-- where bindings bind a value to a name
evaluateBmi :: (RealFloat a) => a -> a -> String
evaluateBmi weight height
  | bmi <= skinny = "You're underweight"
  | bmi <= normal = "You're normal weight"
  | bmi <= overweight = "You're overweight"
  | otherwise = "You're obese"
  where
    bmi = weight / height ^ 2
    skinny = 18.5
    normal = 25.0
    overweight = 30.0

getInitials :: String -> String -> String
getInitials firstname lastname = [first, last]
  where
    first : _ = firstname
    last : _ = lastname

calculateBmis :: (RealFloat a) => [(a, a)] -> [a]
calculateBmis bmis =
  [calculateBmi weight height | (weight, height) <- bmis]
  where
    calculateBmi weight height = weight / height ^ 2