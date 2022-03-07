module Mouths where
import Graphics.Gloss

{-  generateMouth x y mouthChoice colorChoice
    The function generates a mouth.
    RETURNS: picture of mouthChoice with the color colorChoice where centre of mouthChoice is placed in coordinates x y.
    PRE: --NOT SURE
    EXAMPLES: generateMouth 0 0 "1" softRed == pictures [(Translate 0 0 (mo1 softRed))]
-}
generateMouth :: Float -> Float -> String -> Color -> Picture
generateMouth xo yo mo clr
    | mo == "1"     = pictures [Translate xo (-200+yo) (mo1 clr)]
    | mo == "2"     = pictures [Translate xo (-200+yo) (mo2 clr)]
    | mo == "3"     = pictures [Translate xo (-200+yo) (mo3 clr)]
    | otherwise = Blank
---------------------------------------------------------
-- COORDINATES FOR MOUTH1 --
mo1p1 = (-75,0)
mo1p2 = (-50, 20)
mo1p3 = (-12.5,25)
mo1p4 = (0,12.5)
mo1p5 = (12.5,25)
mo1p6 = (50,20)
mo1p7 = (75,0)

mo1AlongX1 = (-50,0)
mo1AlongX2 = (-12.5,0)
mo1AlongX3 = (0,0)
mo1AlongX4 = (12.5,0)
mo1AlongX5 = (50,0)

mo1lowp1 = (-50,-25)
mo1lowp2 = (50,-25)

mo1Pol1 = Polygon [mo1p1,mo1p2,mo1AlongX1]
mo1Pol2 = Polygon [mo1p2,mo1p3,mo1AlongX2,mo1AlongX1]
mo1Pol3 = Polygon [mo1p3,mo1p4,mo1AlongX3,mo1AlongX2]
mo1Pol4 = Polygon [mo1p4,mo1p5,mo1AlongX4,mo1AlongX3]
mo1Pol5 = Polygon [mo1p5,mo1p6,mo1AlongX5,mo1AlongX4]
mo1Pol6 = Polygon [mo1p6,mo1p7,mo1AlongX5]
mo1LowPol1 = Polygon [mo1AlongX5,mo1p7,mo1lowp2]
mo1LowPol2 = Polygon [mo1AlongX1,mo1AlongX5,mo1lowp2,mo1lowp1]
mo1LowPol3 = Polygon [mo1p1,mo1AlongX1,mo1lowp1]

mo1Upperlip = pictures [mo1Pol1,mo1Pol2,mo1Pol3,mo1Pol4,mo1Pol5,mo1Pol6]
mo1Lowerlip = pictures [mo1LowPol1,mo1LowPol2,mo1LowPol3]
--------------------------------------------------------------------------
--POSSIBLE MOUTHS--

mo1 clr = translate 0 (-50) (scale 2 1.5 (pictures [color (dim clr) mo1Upperlip,color clr mo1Lowerlip]))
mo2 clr = scale 0.75 0.50 (color clr (thickArc 180 360 150 12.5))
mo3 clr = translate 0 (-100) (scale 0.75 0.50 (color clr (thickArc 360 180 150 12.5)))

--dispmo1 = display FullScreen white (pictures [eggshape,(color (light(light(red))) mo1Upperlip), (color (light (light (light red))) mo1Lowerlip)])
--dispmo2 = display FullScreen white (pictures [eggshape, (color (light (light red))mo2)])
--dispmo3 = display FullScreen white (pictures [eggshape,(color (light (light red))mo3)])

