module FaceShapes where
import Graphics.Gloss

{-  generateFaceShape x y faceShapeChoice colorChoice
    The function generates a face shape.
    RETURNS: picture of faceShapeChoice with the color colorChoice where centre of faceShapeChoice is placed in coordinates x y.
    PRE: --NOT SURE
    EXAMPLES: generateFaceShape 0 0 "1" lighterSkin == pictures [(Translate 0 0 (eggshape lighterSkin))]
-}
generateFaceShape :: Float -> Float -> String -> Color -> Picture
generateFaceShape x y fac clr
    | fac == "1"    = pictures [(Translate x y (eggshape clr))]
    | fac == "2"    = pictures [(Translate x y (roundshape clr))]
    | fac == "3"    = pictures [(Translate x y (diamondshape clr))]
    | fac == "4"    = pictures [(Translate x y (squareshape clr))]
    | otherwise = Blank

eggshape clr = (color clr (polygon [(0,500),(250,450),(350,300),(375,150),(375,0),(350,-150),(300,-300),(200,-400),(50,-500),
                    (-50,-500),(-200,-400),(-300,-300),(-350,-150),(-375,0),(-375,150),(-350,300),(-250,450),(0,500)]))
roundshape clr   = (color clr (circleSolid 500))
diamondshape clr = (color clr (polygon [(0,500),(500,0),(0,-500),(-500,0)]))
squareshape  clr = (color clr (polygon [(-500,500),(500,500),(500,-500),(-500,-500)]))