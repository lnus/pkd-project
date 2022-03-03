module Eyes where
import Graphics.Gloss
import Colors
import FaceShapes
------------------------------------------------------------
-- COORDINATES FOR EYE1 --
u1Eye1 = (-250, 0)
u1Eye2 = (-200, 25)
u1Eye3 = (-150, 25)
u1Eye4 = (-100, 0)

u2Eye2 = (-200, 20)
u2Eye3 = (-150, 20)

upperEyeLid = pictures [(Polygon [u1Eye1,u1Eye2,u2Eye2]),(Polygon[u1Eye2,u1Eye3,u2Eye3,u2Eye2]),(Polygon[u1Eye3,u1Eye4,u2Eye3])]-- change later so that it becomes a solid picture

ruEyeLid    = upperEyeLid
luEyeLid    = Translate 350 0 (upperEyeLid)

loEye1 = (-200, -25)
loEye2 = (-175, -27)
loEye3 = (-150, -25)
lowerEyeLid = Line [loEye1,loEye2,loEye3]

rlEyeLid = lowerEyeLid
llEyeLid = Translate 350 0 (lowerEyeLid)

glare  = color (withAlpha 0.5 white) (circleSolid 8) 
rGlare = translate (-185) 5 glare
lGlare = translate 165 5 glare 

pupil  = circleSolid 15
rPupil = translate (-175) 0 pupil
lPupil = translate 175 0 pupil

iris  = (circleSolid 25)
rIris = translate (-175) 0 iris
lIris = translate 175 0 iris

eyeW1 = (-250, 0)
eyeW2 = (-200, 25)
eyeW3 = (-150, 25)
eyeW4 = (-100, 0)
eyeW5 = (-120, -12.5)
eyeW6 = (-150, -25)
eyeW7 = (-175, -27)
eyeW8 = (-200, -25)
eyeW9 = (-230, -12.5)
eyeWhite    = color white (Polygon [eyeW1,eyeW2,eyeW3,eyeW4,eyeW5,eyeW6,eyeW7,eyeW8,eyeW9,eyeW1])

rEyeWhite = eyeWhite
lEyeWhite = Translate 350 0 eyeWhite

rEye1 clr = pictures [rEyeWhite,lEyeWhite,(color clr rIris),rPupil,rGlare,ruEyeLid,rlEyeLid]
lEye1 clr = pictures [lEyeWhite,lEyeWhite,(color clr lIris),lPupil,lGlare,luEyeLid,llEyeLid]

normalEyes  = pictures [rEyeWhite,lEyeWhite,rIris,lIris,rPupil,lPupil,rGlare,lGlare,ruEyeLid,luEyeLid,rlEyeLid,llEyeLid]
bigEyes     = scale 2 2 normalEyes
smallEyes   = scale 0.5 0.5 normalEyes

-----------------------------------------
-- COORDINATES FOR RIGHT EYE2 --
rupperLineE2p1 = (-75,0)
rupperLineE2p2 = (-74, 25)
rupperLineE2p3 = (-65,50)
rupperLineE2p4 = (-50,60)
rupperLineE2p5 = (-25,70)
rupperLineE2p6 = (0,70) 
rupperLineE2p7 = (25,65)
rupperLineE2p8 = (50, 50)
rupperLineE2p9 = (70, 20)
rupperLineE2p10 = (75, 0)

rupperLowE2p2 = (-74, 20)
rupperLowE2p3 = (-65, 45)
rupperLowE2p4 = (-50, 55)
rupperLowE2p5 = (-25, 65)
rupperLowE2p6 = (0, 65)
rupperLowE2p7 = (25, 60)
rupperLowE2p8 = (50,45)
rupperLowE2p9 = (70,15)

e2polygon1 = Polygon [rupperLineE2p1,rupperLineE2p2,rupperLowE2p2,rupperLineE2p1]
e2polygon2 = Polygon [rupperLineE2p2,rupperLineE2p3,rupperLowE2p3,rupperLowE2p2]
e2polygon3 = Polygon [rupperLineE2p3,rupperLineE2p4,rupperLowE2p4,rupperLowE2p3]
e2polygon4 = Polygon [rupperLineE2p4,rupperLineE2p5,rupperLowE2p5,rupperLowE2p4]
e2polygon5 = Polygon [rupperLineE2p5,rupperLineE2p6,rupperLowE2p6,rupperLowE2p5]
e2polygon6 = Polygon [rupperLineE2p6,rupperLineE2p7,rupperLowE2p7,rupperLowE2p6]
e2polygon7 = Polygon [rupperLineE2p7,rupperLineE2p8,rupperLowE2p8,rupperLowE2p7]
e2polygon8 = Polygon [rupperLineE2p8,rupperLineE2p9,rupperLowE2p9,rupperLowE2p8]
e2polygon9 = Polygon [rupperLineE2p9,rupperLineE2p10,rupperLowE2p9]
upperEye2Lid = pictures [e2polygon1,e2polygon2,e2polygon3,e2polygon4,e2polygon5,e2polygon6,e2polygon7,e2polygon8,e2polygon9]

lowerE2p1 = (-65,-12.5)
lowerE2p2 = (-50,-25)
lowerE2p3 = (-25,-37.5)
lowerE2p4 = (25,-37.5)
lowerE2p5 = (50,-25)
lowerLineE2 = (Line [lowerE2p2,lowerE2p3,lowerE2p4,lowerE2p5])
lowerE2p6 = (65,-12.5)

rglare2 = translate (-25) 25 (color (withAlpha 0.4 white) (circleSolid 15))
rpupil2 = translate 0 17 (circleSolid 25)
riris2 = translate 0 17 (circleSolid 50)
rwhite2 = color white (Polygon [rupperLineE2p1,rupperLineE2p2,rupperLineE2p3,rupperLineE2p4,rupperLineE2p5,rupperLineE2p6,rupperLineE2p7,rupperLineE2p8,rupperLineE2p9,rupperLineE2p10,lowerE2p6,lowerE2p5,lowerE2p4,lowerE2p3,lowerE2p2,lowerE2p1,rupperLineE2p1])
--------------------------------------------------------------
-- COORDINATES FOR LEFT EYE2 --
lupperLineE2p1 = (75,0)
lupperLineE2p2 = (74, 25)
lupperLineE2p3 = (65,50)
lupperLineE2p4 = (50,60)
lupperLineE2p5 = (25,70)
lupperLineE2p6 = (0,70) 
lupperLineE2p7 = (-25,65)
lupperLineE2p8 = (-50, 50)
lupperLineE2p9 = (-70, 20)
lupperLineE2p10 = (-75, 0)

lupperLowE2p2 = (74, 20)
lupperLowE2p3 = (65, 45)
lupperLowE2p4 = (50, 55)
lupperLowE2p5 = (25, 65)
lupperLowE2p6 = (0, 65)
lupperLowE2p7 = (-25, 60)
lupperLowE2p8 = (-50,45)
lupperLowE2p9 = (-70,15)

le2polygon1 = Polygon [lupperLineE2p1,lupperLineE2p2,lupperLowE2p2,lupperLineE2p1]
le2polygon2 = Polygon [lupperLineE2p2,lupperLineE2p3,lupperLowE2p3,lupperLowE2p2]                 
le2polygon3 = Polygon [lupperLineE2p3,lupperLineE2p4,lupperLowE2p4,lupperLowE2p3]
le2polygon4 = Polygon [lupperLineE2p4,lupperLineE2p5,lupperLowE2p5,lupperLowE2p4]
le2polygon5 = Polygon [lupperLineE2p5,lupperLineE2p6,lupperLowE2p6,lupperLowE2p5]
le2polygon6 = Polygon [lupperLineE2p6,lupperLineE2p7,lupperLowE2p7,lupperLowE2p6]
le2polygon7 = Polygon [lupperLineE2p7,lupperLineE2p8,lupperLowE2p8,lupperLowE2p7]
le2polygon8 = Polygon [lupperLineE2p8,lupperLineE2p9,lupperLowE2p9,lupperLowE2p8]
le2polygon9 = Polygon [lupperLineE2p9,lupperLineE2p10,lupperLowE2p9]
lupperEye2Lid = pictures [le2polygon1,le2polygon2,le2polygon3,le2polygon4,le2polygon5,le2polygon6,le2polygon7,le2polygon8,le2polygon9]

llowerE2p1 = (-65,-12.5)
llowerE2p2 = (-50,-25)
llowerE2p3 = (-25,-37.5)
llowerE2p4 = (25,-37.5)
llowerE2p5 = (50,-25)
llowerLineE2 = (Line [llowerE2p2,llowerE2p3,llowerE2p4,llowerE2p5])
llowerE2p6 = (65,-12.5)

lglare2 = translate (-25) 25 (color (withAlpha 0.4 white) (circleSolid 15))
lpupil2 = translate 0 17 (circleSolid 25)
liris2 = translate 0 17 (circleSolid 50)
lwhite2 = color white (Polygon [lupperLineE2p1,lupperLineE2p2,lupperLineE2p3,lupperLineE2p4,lupperLineE2p5,lupperLineE2p6,lupperLineE2p7,lupperLineE2p8,lupperLineE2p9,lupperLineE2p10,llowerE2p1,llowerE2p2,llowerE2p3,llowerE2p4,llowerE2p5,llowerE2p6,lupperLineE2p1])
-----------------------------------------------------
rEye2 clr = (pictures [rwhite2,(color clr riris2),rpupil2,rglare2,lowerLineE2,upperEye2Lid])
lEye2 clr = (pictures [lwhite2,(color clr liris2),lpupil2,lglare2,llowerLineE2,lupperEye2Lid])
-----------------------------------------------------

{-  generateEye x y eyeChoice colorChoice
    The funciton generates a picture of two eyes.
    RETURNS: pictures of eyeChoice with corresponding x- and y-coordinates with color colorChoice.
    PRE: -- NOT SURE
    EXAMPLES:   generateEye 200 0 "2" lightBlue == pictures [(Translate (-200) 0 (rEye2 lightBlue)),(Translate 200 0 (lEye2 lightBlue))]

-}
generateEye :: Float -> Float -> String -> Color -> Picture
generateEye x y eye clr
    | eye == "1"     = pictures [(rEye1 clr),(lEye1 clr)]
    | eye == "2"     = pictures [(Translate (-x) y (rEye2 clr)),(Translate x y (lEye2 clr))]
    | otherwise = Blank

-- test3Eye2 = display FullScreen white (pictures [(color darkerSkin eggshape),(generateEye 200 0 "2" lightBlue)])