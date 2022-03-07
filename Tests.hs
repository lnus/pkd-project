module Tests where

import Colors (brown, generateColor, lighterSkin)
import Eyebrows (generateEyebrows, lThinbrow, rThinbrow)
import Eyes (generateEye, lEye1, rEye1)
import FaceShapes (generateFaceShape, eggshape)
import Hair (generateFringe, generateHair, spikyHair)
import Mouths (generateMouth, mo1)
import Noses (generateNose, nose1)
import Test.HUnit
import Graphics.Gloss

testColors1 :: Test
testColors1 = TestCase (assertEqual "for generateColor (\"1\" \"2\")," lighterSkin (generateColor "1" "2"))

testColors2 :: Test
testColors2 = TestCase (assertEqual "for generateColor (\"2\" \"3\")," brown (generateColor "2" "3"))

testEyebrows :: Test
testEyebrows = TestCase (assertEqual "for generateEyebrows (0 0 \"1\" brown)," (pictures [color brown (translate 0 0 lThinbrow), color brown (translate 0 0 rThinbrow)]) (generateEyebrows 0 0 "1" brown))

testEyes :: Test
testEyes = TestCase (assertEqual "for generateEyes (0 0 \"1\" brown)," (pictures [translate (-200) 0 (rEye1 brown), translate 200 0 (lEye1 brown)]) (generateEye 0 0 "1" brown))

testFace :: Test
testFace = TestCase (assertEqual "for generateFaceShape (0 0 \"1\" lightherSkin)," (pictures [Translate 0 0 (eggshape lighterSkin)]) (generateFaceShape 0 0 "1" lighterSkin))

testHair :: Test
testHair = TestCase (assertEqual "for generateHair (0 0 \"1\" brown)," Blank (generateHair 0 0 "1" brown))

testFringe :: Test
testFringe = TestCase (assertEqual "for generateFringe (0 0 \"1\" brown)," (pictures [color brown (translate 0 200 spikyHair)]) (generateFringe 0 0 "1" brown))

testMouth :: Test
testMouth = TestCase (assertEqual "for generateMouth (0 0 \"1\" brown)," (pictures [Translate 0 (-200) (mo1 brown)]) (generateMouth 0 0 "1" brown))

testNose :: Test
testNose = TestCase (assertEqual "for generateNose (0 0 \"1\" brown)," (pictures [Translate 0 0 (nose1 brown)]) (generateNose 0 0 "1" brown))

tests :: Test
tests = TestList [
    TestLabel "Color test 1" testColors1,
    TestLabel "Color test 2" testColors2,
    TestLabel "Eyebrow test" testEyebrows,
    TestLabel "Eye test" testEyes,
    TestLabel "Face test" testFace,
    TestLabel "Hair test" testHair,
    TestLabel "Fringe test" testFringe,
    TestLabel "Mouth test" testMouth,
    TestLabel "Nose test" testNose
    ]

runtests :: IO Counts
runtests = runTestTT tests