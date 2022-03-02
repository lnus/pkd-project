module Hair where
import Graphics.Gloss

{-generateHair

-}

generateHair :: Float -> Float -> String -> Color -> Picture
generateHair x y choice clr 
    | choice == "1" = pictures [color clr (translate x y spikyHair)]
    | choice == "2" = pictures [color clr (translate x y longHair)]
    | choice == "3" = pictures [color clr (translate x y bald)] 
    | otherwise     = Blank

hair = pictures [spikyHair, longHair, bald]

bald =  translate 0 75 (rotate 145 (scale 2 1 (circleSolid 50)))

spikyHair = pictures [translate 20 20 spikes,translate 0 0 spikes, translate (-10) (-10) spikes]
spikes    = pictures [spike1,translate (-40) 0 spike1,translate 40 0 spike1,translate 80 (-5) spike1, translate (-80) (-5) spike1,
                     translate (-120) (-10) spike1, translate 120 (-10) spike1, translate 160 (-15) spike1, translate (-160) (-15) spike1]
spike1    = polygon  [(-40,0),(-20,200),(0,0)]

longHair      = pictures  [sideLeftHair, frontHair, sideRightHair]
frontHair     = translate 0      0 (scale 3   2   (circleSolid 200))
sideLeftHair  = translate (-500) 0 (scale 1.5 2   (circleSolid 200))
sideRightHair = translate 500    0 (scale 1.5 2   (circleSolid 200))