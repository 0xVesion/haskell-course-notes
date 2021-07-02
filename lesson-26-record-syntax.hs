module RecordSyntax where

data Person = Person
  { firstName :: String,
    lastName :: String,
    age :: Int,
    height :: Float,
    phoneNumber :: String,
    flavor :: String
  }
  deriving (Show)

somePerson =
  Person
    { firstName = "Vincent",
      lastName = "XX",
      age = 99,
      height = 3.2,
      phoneNumber = "+1012345678",
      flavor = "vanilla"
    }

welcomePerson = "Hello " ++ firstName somePerson ++ "!"