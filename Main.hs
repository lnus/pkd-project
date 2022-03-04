module Main where

import System.Random
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

-- We should load in the things that are wanted and put them
-- in an array, after this, compile all things in order
-- in here.

-- THIS IS ABSOLUTELY NOT FINAL.
-- VERY SIMPLE DEMO

type Option = Int

generateRender :: [Picture] -> IO ()
generateRender [] = display (InWindow "Error" (1500, 1000) (10, 10)) white (text "No input")
generateRender pic = display (InWindow "Face" (1500, 1000) (10, 10)) white (pictures pic)

-- TODO: Make this look prettier, maybe?
presentOptions :: Int -> [String] -> String
presentOptions _ [] = ""
presentOptions aux [x] = show aux ++ ". " ++ x
presentOptions aux (x : xs) = show aux ++ ". " ++ x ++ "\n" ++ presentOptions (aux + 1) xs

-- Is this necessary? ^

-- TODO: Document this
-- FIXME: Make the user able to break out of this. Since well... it's currently impossible.
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

calcRandom :: Int -> Float -> Float
calcRandom base weight = fromIntegral base * weight

{- main
   Run the generator
   Side-effects: Quite a lot, actually
-}
-- TODO: More creative descriptions for options, possibly
main :: IO ()
main = do
  putStrLn "Generate a face!"

  faceChoice <- getChoice "Which face do you want?" ["Face 1", "Face 2", "Face 3", "Face 4"]
  eyeChoice <- getChoice "What eyes do you want?" ["Eye 1", "Eye 2"]
  -- TODO: Add check for eye-color
  noseChoice <- getChoice "What nose do you want?" ["Nose 1", "Nose 2"]
  mouthChoice <- getChoice "Which mouth do want?!?!!??" ["Mouth 1", "Mouth 2", "Mouth 3"]
  browChoice <- getChoice "Which eyebrows do you want?" ["Eyebrows 1", "Eyebrows 2", "Eyebrows 3"]
  hairChoice <- getChoice "Which hair do you want?" ["Hair 1", "Hair 2", "Hair 3"]

  randomWeight <- randomIO :: IO Float -- creates random between 0-1, this will scale the base
  randomBase <- randomRIO (-100, 100) :: IO Int -- create random between -100-100, base value of the randomness

  generateRender
    [ generateHair 0 0 (show hairChoice) brunette,
      generateFaceShape 0 0 (show faceChoice) lightSkin,
      -- randomness implementation examples
      -- calcRandom should generate a base and weight on its own in the maybe?
      generateEye (calcRandom randomBase randomWeight) 0 (show eyeChoice) lightBlue,
      generateNose (calcRandom randomBase randomWeight) 0 (show noseChoice) softRed, 
      generateMouth 0 (-200) (show mouthChoice) brunette,
      generateEyebrows 0 100 (show browChoice) brunette,
      generateFringe 0 0 (show hairChoice) brunette
    ]