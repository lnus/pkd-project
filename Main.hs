module Main where

import Colors
import Control.Exception
import Eyebrows
import Eyes
import FaceShapes
import Graphics.Gloss
import Hair
import Mouths
import Noses
import System.Exit (ExitCode (ExitSuccess), exitSuccess, exitWith)
import System.Random

type Option = Int

generateRender :: [Picture] -> IO ()
generateRender [] = display (InWindow "Error" (1500, 1000) (10, 10)) white (text "No input")
generateRender pic = display (InWindow "Face" (1500, 1000) (10, 10)) white (pictures pic)

presentOptions :: Int -> [String] -> String
presentOptions _ [] = ""
presentOptions aux [x] = show aux ++ ". " ++ x
presentOptions aux (x : xs) = show aux ++ ". " ++ x ++ "\n" ++ presentOptions (aux + 1) xs

-- Is this necessary? ^

-- TODO: Document this
getChoice :: String -> [String] -> IO Option
getChoice question options = do
  putStrLn question
  putStrLn (presentOptions 1 options)
  putStrLn "9. Exit the program"
  catch
    ( do
        line <- getLine
        if read line <= length options || read line == 9
          then evaluate (read line) -- safety measure, in case of bad input
          else do
            putStrLn ("[INPUTERR] Options must be between 1 and " ++ show (length options) ++ " or 9.")
            getChoice question options
    )
    ( ( \_ -> do
          putStrLn "[INPUTERR] Invalid input, must be a number."
          getChoice question options
      ) ::
        SomeException -> IO Option
    )

{- calcRandom
  Gives back a random positioning seed used to move certain attributes
  Takes in the base random and the scale of the randomness
  RETURNS: A number used to move attributes of a face
-}
calcRandom :: Int -> Float -> Float
calcRandom base weight = fromIntegral base * weight

{- main
   Runs the generator
   Side-effects: Not sure yet, if the OpenGL driver is bad it might bork everything
-}
main :: IO ()
main = do
  putStrLn "Generate a face!"

  faceChoice <- getChoice "Which face shape do you want?" ["Oblong face", "Round face", "Diamond face", "Square face"]
  eyeChoice <- getChoice "What eyes do you want?" ["Creepy eyes", "Cute eyes"]
  noseChoice <- getChoice "What nose do you want?" ["Triangle nose", "Longer nose"]
  mouthChoice <- getChoice "Which mouth do you want?" ["Bored", "Smiling", "Angry"]
  browChoice <- getChoice "Which eyebrows do you want?" ["Thin brows", "Thick brows", "Square brows"]
  hairChoice <- getChoice "Which hair do you want?" ["Spiky hair", "Cute fringe", "Bald"]

  eyeColor <- getChoice "Which eye color do you want?" ["Light blue", "Light green", "Brown"]
  hairColor <- getChoice "Which hair color do you want?" ["Blonde", "Brunette", "Dark hair", "Cool hair"]
  skinColor <- getChoice "Which skin color do you want?" ["Light", "Lighter", "Dark", "Darker"]

  randomWeight <- randomIO :: IO Float -- creates random between 0-1, this will scale the base
  randomBase <- randomRIO (-100, 100) :: IO Int -- create random between -100-100, base value of the randomness
  mouthAndNose <- randomRIO (1, 2) :: IO Int -- random mouth and nose color
  generateRender
    [ generateHair 0 0 (show hairChoice) (generateColor "4" (show hairColor)),
      generateFaceShape 0 0 (show faceChoice) (generateColor "1" (show skinColor)),
      generateEye (calcRandom randomBase randomWeight) 0 (show eyeChoice) (generateColor "2" (show eyeColor)),
      generateNose (calcRandom randomBase randomWeight) 0 (show noseChoice) (generateColor "3" (show mouthAndNose)),
      generateMouth 0 0 (show mouthChoice) (generateColor "3" (show mouthAndNose)),
      generateEyebrows 0 100 (show browChoice) (generateColor "4" (show hairColor)),
      generateFringe 0 0 (show hairChoice) (generateColor "4" (show hairColor))
    ]