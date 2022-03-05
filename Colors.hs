module Colors where
import Graphics.Gloss

generateColor :: String -> String -> Color
generateColor part clr
    | part == "1"  = case clr of
                            "1" -> lightSkin
                            "2" -> lighterSkin
                            "3" -> darkerSkin
                            "4" -> darkSkin
    | part == "2"  = case clr of
                            "1" -> lightBlue
                            "2" -> lightGreen
                            "3" -> brown
    | part == "3"  = case clr of
                            "1" -> softRed
                            "2" -> darkerSoftRed
    | part == "4"  = case clr of
                            "1" -> blond
                            "2" -> brunette
                            "3" -> darkHair
                            "4" -> coolHair

-- MAIN COLORS --
-- Mainly used for skin.
lightSkin   = makeColorI 255 230 216 255
lighterSkin = makeColorI 239 198 173 255
darkerSkin  = makeColorI 198 143 109 255
darkSkin    = makeColorI 118 77 52 255

-- Mainly used for eyes.
lightBlue  = makeColorI 113 132 182 255
lightGreen = makeColorI 100 121 102 255
brown      = makeColorI 70 46 33 255

-- Mainly used for nose and lips.
softRed       = makeColorI 219 142 134 255
darkerSoftRed = makeColorI 169 109 103 255

-- Mainly used for hair.
blond    = makeColorI 150 132 97 255
brunette = makeColorI 73 44 44 255
darkHair = makeColorI 35 40 51 255
coolHair = makeColorI 91 42 124 255