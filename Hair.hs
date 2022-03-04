module Hair where

import Graphics.Gloss

{-generateHair x y choiceOfHair clr
    Creates a hair on the back of the head (Should be used with GenerateFringe)
    PRE:--
    SIDEFFECTS:--
    RETURNS: A picture of the chosen hair in position x and y with the color clr or a blank picture
    EXAMPLES: generateHair 1 2 "2" blue  == pictures [color blue (translate 1 2 longhair)]
              generateHair 2 1 "u" green == Blank
-}

generateHair :: Float -> Float -> String -> Color -> Picture
generateHair xo yo choice clr
  | choice == "1" = Blank -- spiky hair is only fringe
  | choice == "2" = pictures [color clr (translate x y longHair)]
  | choice == "3" = Blank -- bald head is only fringe
  | otherwise = Blank
  where
    x = 0 + xo
    y = 200 + yo

{- generateFringe x-pos y-pos choiceOfHair clr
    Creates the fringe of the hairdo (Should be used with generateHair)
    PRE:--
    SIDEEFFECTS:--
    RETURNS: A picture of the chosen hair in position x and y with the color clr or a blank picture
    EXAMPLES: generateFringe 2 1 "2" green == pictures [color green (translate 2 1 longFringe)]
              generateFringe 9 4 "h" red   == Blank
              generateFringe 1 2 "3" blue  == pictures [color baldColor (translate (1-200) 2 bald)]
-}
generateFringe :: Float -> Float -> String -> Color -> Picture
generateFringe xo yo choice clr
  | choice == "1" = pictures [color clr (translate x y spikyHair)]
  | choice == "2" = pictures [color clr (translate x y longFringe)]
  | choice == "3" = pictures [color baldColor (translate (x-200) y bald)]
  | otherwise = Blank
  where
    x = 0 + xo
    y = 200 + yo

hair = pictures [spikyHair, longHair, bald]
---------------------------------------------

--HAIR 3
bald = translate 0 75 (rotate 145 (scale 2 1 (circleSolid 50)))
baldColor = withAlpha 0.5 white

--HAIR 1
spikyHair = pictures [translate 20 20 spikes, translate 0 0 spikes, translate (-10) (-10) spikes]
spikes =
  pictures
    [ spike1,
      translate (-40) 0 spike1,
      translate 40 0 spike1,
      translate 80 (-5) spike1,
      translate (-80) (-5) spike1,
      translate (-120) (-10) spike1,
      translate 120 (-10) spike1,
      translate 160 (-15) spike1,
      translate (-160) (-15) spike1
    ]
spike1 = polygon [(-40, 0), (-20, 200), (0, 0)]

--HAIR 2
longHair = pictures [sideLeftHair, frontHair, sideRightHair]
longFringe = arcSolid 0 180 400

frontHair = translate 0 0 (scale 3 2 (circleSolid 200))
sideLeftHair = translate (-500) 0 (scale 1.5 2 (circleSolid 200))
sideRightHair = translate 500 0 (scale 1.5 2 (circleSolid 200))