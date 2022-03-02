module Main where

import Colors
import Control.Exception
import Eyes
import FaceShapes
import Graphics.Gloss
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
main :: IO ()
main = do
  putStrLn "Generate a face!"
  eye_choice <- getChoice "What eyes do you want?" ["Eye 1", "Eye 2"]
  face_choice <- getChoice "Which face do you want?" ["Face 1", "Face 2"] -- FIXME: Doesn't do anything yet
  if eye_choice == 9 -- FIXME: Make this more dynamic for all choices
    then exitSuccess
    else generateRender [color lightSkin eggshape, generateEye 200 0 (show eye_choice) lightBlue]