-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.


{-# LANGUAGE OverloadedStrings #-}

module Duckling.Email.EN.Corpus
  ( corpus
  , negativeCorpus
  ) where

import Data.String
import Prelude

import Duckling.Email.Types
import Duckling.Testing.Types

negativeCorpus :: NegativeCorpus
negativeCorpus = (testContext, examples)
  where
    examples =
      [ "fitness at 6.40"
      , "class at 12.00"
      , "tonight at 9.15"
      , " dot 2@abci"
      , "x@ dot x"
      , "x@ x dot "
      ]

corpus :: Corpus
corpus = (testContext, allExamples)

allExamples :: [Example]
allExamples = concat
  [ examples (EmailData "alice@exAmple.io")
             [ "alice at exAmple.io"
             ]
  , examples (EmailData "yo+yo@blah.org")
             [ "yo+yo at blah.org"
             ]
  , examples (EmailData "1234+abc@x.net")
             [ "1234+abc at x.net"
             ]
  , examples (EmailData "jean-jacques@stuff.co.uk")
             [ "jean-jacques at stuff.co.uk"
             ]
  , examples (EmailData "lukas.koebis+a.b@gmail.com")
             [ "lukas dot koebis+a dot b at gmail dot com"
             ]
  ]
