module Main where

main = putStrLn "Hello, World!"

-- list comprehension
listComprehension = [x * 2 | x <- [1 .. 10]] -- list comprehension define a sublist of a given list

listComprehensionWithPredicate = [x * 2 | x <- [1 .. 10], x * 2 < 12] -- list comprehensions can also have predicates which further restrict the subset

listComprehensionExample = [x | x <- [50 .. 100], x `mod` 7 == 3]

listCompBoomBang xs = [if x > 10 then "BANG!" else "BOOM!" | x <- xs, odd x]

listCompMultiPredicates = [x | x <- [1 .. 20], x /= 15, x /= 16, x /= 17]

listCompMultiInput = [x * y | x <- [1 .. 3], y <- [10 .. 13]] -- list comprehensions can have multiple inputs

-- list comprehensions with multiple inputs will produce a resulting list with all possible outocomes
listCompSentences =
  [ adjective ++ " " ++ noun
    | adjective <- ["cute", "awesome", "great"],
      noun <- ["bob", "alice", "foo"]
  ]

-- _ means that we will draw from the list even though we don't use the elements inside it
listCompLength xs = sum [1 | _ <- xs]

-- remember strings are lists. This means we can use list comprehension on strings
listCompRemoveNonUpper str = [char | char <- str, char `elem` ['A' .. 'Z']]

listCompRemoveNestedOdds outer =
  [ [ el
      | el <- inner,
        even el
    ]
    | inner <- outer
  ]