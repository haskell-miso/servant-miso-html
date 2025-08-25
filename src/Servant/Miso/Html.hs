-----------------------------------------------------------------------------
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE RecordWildCards       #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Servant.Miso.Html
-- Copyright   :  2016-2025 (C) dmjio
-- License     :  BSD3-style (see the file LICENSE)
-- Maintainer  :  David M. Johnson <code@dmj.io>
-- Stability   :  experimental
-- Portability :  non-portable
----------------------------------------------------------------------------
module Servant.Miso.Html
  ( -- *** Types
    HTML
  ) where
----------------------------------------------------------------------------
import qualified Data.List.NonEmpty as NE
import           Servant.API (Accept (..), MimeRender (..))
import qualified Network.HTTP.Media as M
----------------------------------------------------------------------------
import           Miso.Html.Render (ToHtml (..))
----------------------------------------------------------------------------
-- | HTML MimeType used for servant APIs
--
-- > type Home = "home" :> Get '[HTML] (Component model action)
--
data HTML
----------------------------------------------------------------------------
-- | @text/html;charset=utf-8@
instance Accept HTML where
  contentTypes _ =
    "text" M.// "html" M./: ("charset", "utf-8") NE.:|
      ["text" M.// "html"]
----------------------------------------------------------------------------
-- | Render HTML from a servant API
instance ToHtml a => MimeRender HTML a where
  mimeRender _ = toHtml
----------------------------------------------------------------------------
