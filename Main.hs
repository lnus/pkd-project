module Main where

import Graphics.Gloss
import Eyes

-- We should load in the things that are wanted and put them
-- in an array, after this, compile all things in order
-- in here.

-- THIS IS ABSOLUTELY NOT FINAL.
-- VERY SIMPLE DEMO

generateRender :: [Picture] -> IO ()
generateRender [] = display (InWindow "Error" (1500,1000) (10,10)) white (text "No input")
generateRender pic = display (InWindow "Face" (1500,1000) (10,10)) white (pictures pic)

-- might be used later
-- will save an avatar as a png file, needs gloss-export library unless its gonna be super-yank
-- saveImage :: IO ()

-- this doesnt work
-- combine :: Picture -> [Picture] -> Picture
-- combine li pic = li : (pictures pic)

{- main
   Run the generator
   Side-effects: Quite a lot, actually
-}
main :: IO ()
main = do
   putStrLn "Generate a face!"
   putStrLn "Type, anything... I guess."
   _ <- getLine
   generateRender [fullFace]
   where fullFace = pictures [rEye2, lEye2] -- this will be dynamic
