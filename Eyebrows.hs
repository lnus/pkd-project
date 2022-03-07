module Eyebrows where

import Graphics.Gloss
    ( Color,
      color,
      pictures,
      polygon,
      translate,
      Picture(Translate, Blank) )

{-generateEyebrows x-pos y-pos choiceOfEyebrows color
Function takes a string and returns a pictures of an eyebrow of their choice or a blank picture
PRE: --
SIDEEFFECTS: --
RETURNS: picture of eyebrows or a blank picture
EXAMPLES: generateEyeBrows 20 5 "3" green == pictures [color green (translate (-20) 5 lStraightBrow),color green (translate 20 5 rStraightbrow)]
          generateEyeBrows 5  1 "p" blue  == Blank
-}
generateEyebrows :: Float -> Float -> String -> Color -> Picture
generateEyebrows x y choice clr
  | choice == "1" = pictures [color clr (translate (- x) y lThinbrow), color clr (translate x y rThinbrow)]
  | choice == "2" = pictures [color clr (translate (- x) y lNormalbrow), color clr (translate x y rNormalbrow)]
  | choice == "3" = pictures [color clr (translate (- x) y lStraightbrow), color clr (translate x y rStraightbrow)]
  | otherwise     = Blank

eyebrows     = pictures [normalbrow, thinbrow, straightbrow]
thinbrow     = pictures [lThinbrow, rThinbrow]
normalbrow   = pictures [lNormalbrow, rNormalbrow]
straightbrow = pictures [lStraightbrow, rStraightbrow]
------------------------------------------------------------------
-- EVERYTHING BELOW IS JUST COORDS FOR ALL DOTS IN DIFFERENT EYEBROWS

--EYEBROW 1

rThinbrow = translate 50 0 (pictures [rThinbrowLeft, rThinbrowRight])
rThinbrowLeft = polygon [(0, 0), (0, 20), (100, 45), (120, 45), (120, 25), (100, 35), (0, 0)]
rThinbrowRight = polygon [(120, 25), (120, 45), (200, 30), (250, 20), (275, 10), (290, 5), (300, 0), (200, 10), (120, 25)]

lThinbrow = translate (-50) 0 (pictures [lThinbrowLeft, lThinbrowRight])
lThinbrowRight = polygon [(0, 0), (0, 20), (-100, 45), (-120, 45), (-120, 25), (-100, 35), (0, 0)]
lThinbrowLeft = polygon [(-120, 25), (-120, 45), (-200, 30), (-250, 20), (-275, 10), (-290, 5), (-300, 0), (-200, 10), (-120, 25)]


-- EYEBROW 2

rNormalbrow = translate 50 0 (pictures [rNormalbrowLeft, rNormalbrowRight])
rNormalbrowLeft = polygon [(0, 0), (0, 45), (100, 70), (120, 70), (120, 20), (100, 20), (60, 10), (0, 0)]
rNormalbrowRight = polygon [(120, 70), (200, 55), (250, 35), (275, 20), (300, 0), (200, 20), (120, 20)]

lNormalbrow = translate (-50) 0 (pictures [lNormalbrowLeft, lNormalbrowRight])
lNormalbrowRight = polygon [(0, 0), (0, 45), (-100, 70), (-120, 70), (-120, 20), (-100, 20), (-60, 10), (0, 0)]
lNormalbrowLeft = polygon [(-120, 70), (-200, 55), (-250, 35), (-275, 20), (-300, 0), (-200, 20), (-120, 20)]

-- EYEBROW 3

lStraightbrow = Translate (-75) 0 (polygon [(0, 0), (-10, 40), (-200, 40), (-190, 0)])
rStraightbrow = Translate 75 0 (polygon [(0, 0), (10, 40), (200, 40), (190, 0)])