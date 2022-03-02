module Cli where

import Eyes

-- We should load in the things that are wanted and put them
-- in an array, after this, compile all things in order
-- in here.

-- THIS IS ABSOLUTELY NOT FINAL.
-- VERY SIMPLE DEMO

{- main
   Run the generator
   Side-effects: Quite a lot, actually
-}
main :: IO ()
main = do
    putStrLn "Generate a face!"
    putStrLn "Type, anything... I guess."
    _ <- getLine
    makeFace2

