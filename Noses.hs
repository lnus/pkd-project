module Noses where

import Colors
import Graphics.Gloss

--------------------------------------------------
--nose 1
nose1p1 = (0, 12.5)

nose1p2 = (-50, -150)

nose1p3 = (50, -150)

nose1 clr = (color clr (Polygon [nose1p1, nose1p2, nose1p3]))

--nose 2
nose2p1 = (-10, 12.5)

nose2p2 = (-10, -50)

nose2p3 = (-50, -150)

nose2p4 = (50, -150)

nose2p5 = (10, -50)

nose2p6 = (10, 12.5)

nose2polygon1 = Polygon [nose2p1, nose2p2, nose2p5, nose2p6]

nose2polygon2 = Polygon [nose2p2, nose2p3, nose2p4, nose2p5]

nose2 clr = (color clr (pictures [nose2polygon1, nose2polygon2]))

-------------------------------

generateNose :: Float -> Float -> String -> Color -> Picture
generateNose x y no clr
  | no == "1" = pictures [(Translate x y (nose1 clr))]
  | no == "2" = pictures [(Translate x y (nose2 clr))]
  | otherwise = Blank