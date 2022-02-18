import Graphics.Gloss

genX :: Float -> Float -> [(Float, Float)]
genX aux max | aux < max = (aux, 0) : (aux, max) : (aux, 0) : genX (aux + 50) max
genX aux max = [(aux, 0), (aux, max), (aux, 0)]

genY :: Float -> Float -> [(Float, Float)]
genY aux max | aux < max = (0, aux) : (max, aux) : (0, aux) : genY (aux + 50) max
genY aux max = [(0, aux), (max, aux), (0, aux)]

generateGrid :: Float -> Path
generateGrid max = genY 0 max ++ genX 0 max

mSize = 500

p = generateGrid mSize

l :: Picture
l = Translate (- mSize / 2) (- mSize / 2) (line p)

leyebrow = [(25, 25), (50, 50), (100, 75), (150, 75), (25, 25)]

reyebrow = [(-25, 25), (-50, 50), (-100, 75), (-150, 75), (-25, 25)]

leye = Translate 60 0 (pictures [line [(-25, 0), (0, 25), (50, 0), (0, -25), (-25, 0)], circleSolid 5])

reye = Translate (-60) 0 (pictures [line [(-50, 0), (0, 25), (25, 0), (0, -25), (-50, 0)], circleSolid 5])

moth = Translate (50) (-100) (Rotate 270 (text "D"))

cool = Translate (-200) (-200) (text "NANI!?")

l2 = pictures [polygon leyebrow, polygon reyebrow, leye, reye, cool, moth]

p1 = (0, 0)

p2 = (50, 50)

main = display (InWindow "Nice Window" (round mSize, round mSize) (10, 10)) white l2
