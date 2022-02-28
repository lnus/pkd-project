import Graphics.Gloss

faceshapes = pictures [eggshape,diamondshape,squareshape,roundshape]

eggshape = polygon [(0,500),(250,450),(350,300),(375,150),(375,0),(350,-150),(300,-300),(200,-400),(50,-500),
                    (-50,-500),(-200,-400),(-300,-300),(-350,-150),(-375,0),(-375,150),(-350,300),(-250,450),(0,500)]
roundshape   = circleSolid 500
diamondshape = polygon [(0,500),(500,0),(0,-500),(-500,0)]
squareshape  = polygon [(-500,500),(500,500),(500,-500),(-500,-500)]

