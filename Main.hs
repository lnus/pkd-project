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

{- main
   Run the generator
   Side-effects: Quite a lot, actually
-}
-- TODO: Combine inputs from Eyes, Face, Eyebrows etc...
-- TODO: More creative descriptions for options, possibly
main :: IO ()
main = do
  putStrLn "Generate a face!"
  face_choice <- getChoice "Which face do you want?" ["Face 1", "Face 2", "Face 3", "Face 4"]
  eye_choice <- getChoice "What eyes do you want?" ["Eye 1", "Eye 2"]
  -- TODO: Add check for eye-color
  nose_choice <- getChoice "What nose do you want?" ["Nose 1", "Nose 2"]
  mouth_choice <- getChoice "Which mouth do want?!?!!??" ["Mouth 1", "Mouth 2", "Mouth 3"]
  brow_choice <- getChoice "Which eyebrows do you want?" ["Eyebrows 1", "Eyebrows 2", "Eyebrows 3"]
  hair_choice <- getChoice "Which hair do you want?" ["Hair 1", "Hair 2", "Hair 3"]
  generateRender -- TODO: Make this offset
    [ generateHair 0 0 (show hair_choice) brunette,
      generateFaceShape 0 0 (show face_choice) lightSkin,
      generateEye 0 0 (show eye_choice) lightBlue,
      generateNose 0 0 (show nose_choice) softRed,
      generateMouth 0 (-200) (show mouth_choice) brunette,
      generateEyebrows 0 100 (show brow_choice) brunette,
      generateFringe 0 0 (show hair_choice) brunette
    ]