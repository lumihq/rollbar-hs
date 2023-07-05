{-# LANGUAGE CPP #-}
module Rollbar.Internal.AesonCompat
  ( keyFromText
  , keyMapToHashMap
  ) where

import Data.Aeson (Value)
import Data.HashMap.Strict (HashMap)
import Data.Text (Text)

#if MIN_VERSION_aeson(2, 0, 0)
import Data.Aeson.Key (Key)
import Data.Aeson.KeyMap (KeyMap)
import qualified Data.Aeson.Key as Key
import qualified Data.Aeson.KeyMap as KeyMap

keyFromText :: Text -> Key
keyFromText = Key.fromText

keyMapToHashMap :: KeyMap Value -> HashMap Text Value
keyMapToHashMap = KeyMap.toHashMapText
#else
keyFromText :: Text -> Text
keyFromText = id

keyMapToHashMap :: HashMap Text Value -> HashMap Text Value
keyMapToHashMap = id
#endif
