module Main where

import Control.Exception
import Eyes
import Graphics.Gloss

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
-- FIXME: Clamp options to length of second argument (this will be what the user is presented with)
-- FIXME: Make the user able to break out of this. Since well... it's currently impossible.
getChoice :: String -> [String] -> IO Option
getChoice question options = do
  putStrLn question
  putStrLn (presentOptions 1 options)
  catch
    ( do
        line <- getLine
        evaluate (read line)
    )
    ( ( \_ -> do
          putStrLn "Invalid input, must be a number."
          getChoice question options
      ) ::
        SomeException -> IO Option
    )

-- this doesnt work
-- combine :: Picture -> [Picture] -> Picture
-- combine li pic = li : (pictures pic)

{- main
   Run the generator
   Side-effects: Quite a lot, actually
-}
-- TODO: Make this not so primite, the selection system has to be divided up into another function.
main :: IO ()
main = do
  putStrLn "Generate a face!"
  choice <- getChoice "What eyes do you want?" ["Epic eyes", "Stupid eyes >:("]
  generateRender [eyes !! (choice -1)]
  where
    fullFace = pictures [rEye2, lEye2] -- this will be dynamic
    eyes = [rEye2, lEye2]
