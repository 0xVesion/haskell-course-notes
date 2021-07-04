{-# LANGUAGE NamedFieldPuns #-}

module X where

import qualified Data.Map

data Car = Car
  { company :: String,
    model :: String,
    year :: Int
  }
  deriving (Show)

printCar :: Car -> String
printCar Car {company, model, year} = "This " ++ company ++ " " ++ model ++ " was built in " ++ show year

data Person = Person
  { firstname :: String,
    lastname :: String,
    age :: Int
    -- Various type classes can be automatically derived from without doing any
    -- extra work
  }
  deriving (Eq, Show, Read)

-- When deriving from Ord the order of the value constructors decide the order
-- of values
data Colors = Red | Green | Blue deriving (Eq, Ord)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- types synonyms

type MyString = [Char]

type PhoneNumber = String

type Name = String

type PhoneBook = [(Name, PhoneNumber)]

phoneBook :: PhoneBook
phoneBook =
  [ ("betty", "555-2938"),
    ("bonnie", "452-2928"),
    ("patsy", "493-2928"),
    ("lucille", "205-2928"),
    ("wendy", "939-8282"),
    ("penny", "853-2492")
  ]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name phoneNumber phoneBook = (name, phoneNumber) `elem` phoneBook

-- Type synonyms can be parameterized
type MyMap k v = [(k, v)]

getValue :: (Eq k) => k -> MyMap k v -> Maybe v
getValue key x =
  let results = filter ((== key) . fst) x
   in if null results
        then Nothing
        else Just (snd (head results))

-- Type parameters can be partially applied

type IntMap v = Data.Map.Map Int v

type IntMaPartial = Data.Map.Map Int

-- The either type class is a very useful tool for working with errors.
isCorrect :: Int -> Either String Bool
isCorrect x
  | x == 10 = Right True
  | otherwise = Left "Incorrect"

-- either example

data LockerState = Taken | Free deriving (Eq, Show)

type Code = String

type Id = Int

type LockerMap = Data.Map.Map Id (LockerState, Code)

lockerLookup :: Id -> LockerMap -> Either String (LockerState, Code)
lockerLookup id lockerMap =
  case Data.Map.lookup id lockerMap of
    Nothing -> Left "Locker not found"
    Just (state, code) ->
      if state == Taken
        then Left "Locker is taken"
        else Right (state, code)

lockers :: LockerMap
lockers =
  Data.Map.fromList
    [ (100, (Taken, "ZD39I")),
      (101, (Free, "JAH3I")),
      (103, (Free, "IQSA9")),
      (105, (Free, "QOTSA")),
      (109, (Taken, "893JJ")),
      (110, (Taken, "99292"))
    ]

-- recursive data types

data List a = Empty | Cons a (List a) deriving (Eq, Show)

-- binary trees
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Eq, Show)

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = Node x EmptyTree EmptyTree
treeInsert x (Node a left right)
  | x == a = Node x left right
  | x < a = Node a (treeInsert x left) right
  | x > a = Node a left (treeInsert x right)


treeContains :: (Ord a) => a -> Tree a -> Bool
treeContains _ EmptyTree = False
treeContains search (Node current left right) 
  | search == current = True
  | search < current = treeContains search left
  | search > current = treeContains search right