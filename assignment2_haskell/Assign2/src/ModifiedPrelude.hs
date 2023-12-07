{-# LANGUAGE NoImplicitPrelude #-}

module ModifiedPrelude
  ( module Prelude
  , foldl', foldr
  ) where

import Prelude
  ( Int, Integer, String, Bool(..)
  , Show(..), Num(..), Eq(..), Ord(..), Integral(..)
  , error, otherwise
  , ($), (.), id, const
  , length, (++), reverse
  , zip, unzip
  , map, even , elem, truncate, cos, fromIntegral
  )

import qualified Data.List (foldl', foldr)

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' = Data.List.foldl'

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr = Data.List.foldr
