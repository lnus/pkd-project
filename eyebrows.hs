import Graphics.Gloss

eyebrows         = pictures [normalbrow, thinbrow, straightbrow]
-- translate at 0 for all eyes, needs placement
normalbrow       = pictures [translate 0 0 lNormalbrow, translate 0 0 rNormalbrow]
rNormalbrow      = pictures [rNormalbrowLeft, rNormalbrowRight]
rNormalbrowLeft  = polygon  [(0,0),(0,45),(100,70),(120,70),(120,20),(100,20),(60,10),(0,0)]
rNormalbrowRight = polygon  [(120,70),(200,55),(250,35),(275,20),(300,0),(200,20),(120,20)]
lNormalbrow      = pictures [lNormalbrowLeft, lNormalbrowRight]
lNormalbrowRight = polygon  [(0,0),(0,45),(-100,70),(-120,70),(-120,20),(-100,20),(-60,10),(0,0)]
lNormalbrowLeft  = polygon  [(-120,70),(-200,55),(-250,35),(-275,20),(-300,0),(-200,20),(-120,20)]

thinbrow       = pictures [translate 0 0 lThinbrow, translate 0 0 rThinbrow]
rThinbrow      = pictures [rThinbrowLeft, rThinbrowRight]
rThinbrowLeft  = polygon  [(0,0),(0,20),(100,45),(120,45),(120,25),(100,35),(0,0)]
rThinbrowRight = polygon  [(120,25),(120,45),(200,30),(250,20),(275,10),(290,5),(300,0),(200,10),(120,25)]
lThinbrow      = pictures [lThinbrowLeft, lThinbrowRight]
lThinbrowRight = polygon  [(0,0),(0,20),(-100,45),(-120,45),(-120,25),(-100,35),(0,0)]
lThinbrowLeft  = polygon  [(-120,25),(-120,45),(-200,30),(-250,20),(-275,10),(-290,5),(-300,0),(-200,10),(-120,25)]

straightbrow  = pictures [translate 0 0 lStraightbrow,translate 0 0 rStraightbrow]
lStraightbrow = polygon [(0,0),(-10,40),(-200,40),(-190,0)]
rStraightbrow = polygon [(0,0),(10,40),(200,40),(190,0)]