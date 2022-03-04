module Eyebrows where

import Graphics.Gloss

{-generateEyebrows

-}
generateEyebrows :: Float -> Float -> String -> Color -> Picture
generateEyebrows x y choice clr
  | choice == "1" = pictures [color clr (translate (- x) y lThinbrow), color clr (translate x y rThinbrow)]
  | choice == "2" = pictures [color clr (translate (- x) y lNormalbrow), color clr (translate x y rNormalbrow)]
  | choice == "3" = pictures [color clr (translate (- x) y lStraightbrow), color clr (translate x y rStraightbrow)]
  | otherwise = Blank

eyebrows = pictures [normalbrow, thinbrow, straightbrow]

normalbrow = pictures [lNormalbrow, rNormalbrow]

rNormalbrow = translate 50 0 (pictures [rNormalbrowLeft, rNormalbrowRight])
rNormalbrowLeft = polygon [(0, 0), (0, 45), (100, 70), (120, 70), (120, 20), (100, 20), (60, 10), (0, 0)]
rNormalbrowRight = polygon [(120, 70), (200, 55), (250, 35), (275, 20), (300, 0), (200, 20), (120, 20)]

lNormalbrow = translate (-50) 0 (pictures [lNormalbrowLeft, lNormalbrowRight])
lNormalbrowRight = polygon [(0, 0), (0, 45), (-100, 70), (-120, 70), (-120, 20), (-100, 20), (-60, 10), (0, 0)]
lNormalbrowLeft = polygon [(-120, 70), (-200, 55), (-250, 35), (-275, 20), (-300, 0), (-200, 20), (-120, 20)]

thinbrow = pictures [lThinbrow, rThinbrow]

rThinbrow = translate 50 0 (pictures [rThinbrowLeft, rThinbrowRight])
rThinbrowLeft = polygon [(0, 0), (0, 20), (100, 45), (120, 45), (120, 25), (100, 35), (0, 0)]
rThinbrowRight = polygon [(120, 25), (120, 45), (200, 30), (250, 20), (275, 10), (290, 5), (300, 0), (200, 10), (120, 25)]

lThinbrow = translate (-50) 0 (pictures [lThinbrowLeft, lThinbrowRight])
lThinbrowRight = polygon [(0, 0), (0, 20), (-100, 45), (-120, 45), (-120, 25), (-100, 35), (0, 0)]
lThinbrowLeft = polygon [(-120, 25), (-120, 45), (-200, 30), (-250, 20), (-275, 10), (-290, 5), (-300, 0), (-200, 10), (-120, 25)]

straightbrow = pictures [lStraightbrow, rStraightbrow]

lStraightbrow = Translate (-75) 0 (polygon [(0, 0), (-10, 40), (-200, 40), (-190, 0)])

rStraightbrow = Translate 75 0 (polygon [(0, 0), (10, 40), (200, 40), (190, 0)])