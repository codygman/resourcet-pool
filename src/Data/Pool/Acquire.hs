{-# LANGUAGE LambdaCase #-}

module Data.Pool.Acquire (poolToAcquire) where

import Data.Pool (Pool, destroyResource, putResource, takeResource)
import Data.Acquire (Acquire, ReleaseType(..), mkAcquireType)
import Debug.Trace


debug :: c -> String -> c
debug = flip trace

-- | Convert a 'Pool' into an 'Acquire'.
poolToAcquire :: Pool a -> Acquire a
poolToAcquire pool = fst <$> mkAcquireType getResource (freeResource `debug` "what is the pool state")
  where
    getResource = takeResource pool
    freeResource (resource, localPool) = \case
      ReleaseException -> destroyResource pool localPool resource
      _ -> putResource localPool resource
