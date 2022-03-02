import Graphics.Gloss


genX :: Float -> Float -> [(Float, Float)]
genX aux max | aux < max = (aux, 0) : (aux, max) : (aux, 0) : genX (aux + 50) max
genX aux max = [(aux, 0), (aux, max), (aux, 0)]

genY :: Float -> Float -> [(Float, Float)]
genY aux max | aux < max = (0, aux) : (max, aux) : (0, aux) : genY (aux + 50) max
genY aux max = [(0, aux), (max, aux), (0, aux)]

generateGrid :: Float -> Path
generateGrid max = genY 0 max ++ genX 0 max

mSize = 1000

p = generateGrid mSize

l :: Picture
l = Translate (- mSize / 2) (- mSize / 2) (line p)

eggshape = color (light(light(light (light red)))) (polygon [(0,500),(250,450),(350,300),(375,150),(375,0),(350,-150),(300,-300),(200,-400),(50,-500),
                                                            (-50,-500),(-200,-400),(-300,-300),(-350,-150),(-375,0),(-375,150),(-350,300),(-250,450),(0,500)])
--------------------------------------------------
--nose 1
nose1p1 = (0,12.5)
nose1p2 = (-50, -150)
nose1p3 = (50, -150)
baseShapeNose1 = (color (light(light(light red))) (Polygon [nose1p1,nose1p2,nose1p3]))

--nose 2
nose2p1 = (-10, 12.5)
nose2p2 = (-10, -50)
nose2p3 = (-50, -150)
nose2p4 = (50,-150)
nose2p5 = (10,-50)
nose2p6 = (10,12.5)

nose2polygon1 = Polygon [nose2p1,nose2p2,nose2p5,nose2p6]
nose2polygon2 = Polygon [nose2p2,nose2p3,nose2p4,nose2p5]
baseShapeNose2 = (color (light(light(light red))) (pictures [nose2polygon1,nose2polygon2]))
-------------------------------

dispNose1 = display FullScreen red (pictures [eggshape,baseShapeNose1])
dispNose2 = display FullScreen red (pictures [eggshape,baseShapeNose2])