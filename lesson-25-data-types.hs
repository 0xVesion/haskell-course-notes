-- Shape(..) tells Haskell to export all value constructors off Shape
-- We could also just export Shape which would prohibit us from instantiating
-- Shape outside of this module
module Shapes (Point, Shape (..), surface) where

data Point
  = Point Float Float
  deriving (Show)

data Shape
  = Circle Point Float
  | Rectangle Point Point
  deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = abs (x2 - x1) * abs (y2 - y1)

-- Constructors can be partially applied just like functions
partialApply :: [Shape]
partialApply = map (Circle (Point 10 20)) [1, 2, 3]