module Geometry.Cube
  ( cubeVolume,
    cubeArea,
  )
where

import Geometry.Cuboid

cubeVolume :: Float -> Float
cubeVolume side = Geometry.Cuboid.volume side side side

cubeArea :: Float -> Float
cubeArea side = Geometry.Cuboid.area side side side