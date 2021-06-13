module Main where

main = putStrLn "Hello, World!"

-- let bindings

-- Let bindings are like where bindings. They can be used to bind value to a
-- name. The important difference between them is that let bindings are just
-- expressions. They can be used in place of any other expression to define
-- names for later use. The form is `let <bindings> in <expression>`.
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^ 2
   in sideArea + 2 * topArea

-- They can also be used to introduce functions in a local scope:
squares :: [(Integer, Integer, Integer)]
squares = [let square x = x * x in (square 5, square 3, square 2)]

-- Multiple let bindings can be separated with semicolons
separated :: (Integer, String)
separated =
  ( let a = 100; b = 200; c = 300 in a * b * c,
    let foo = "Hey "; bar = "there!" in foo ++ bar
  )

-- You can pattern match in let bindings
patternM :: Integer
patternM = (let (a, b, c) = (1, 2, 3) in a + b + c) * 100

-- You can use let bindings in list comprehensions
calculateBmis :: (RealFloat a) => [(a, a)] -> [a]
calculateBmis bmis =
  [ bmi
    | (weight, height) <- bmis,
      let bmi = weight / height ^ 2,
      bmi >= 25.0
  ]