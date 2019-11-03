module Web exposing (..)

import Browser

import Html exposing (..)
import Html.Lazy exposing (..)
import Html.Attributes exposing (..)

type alias Details = 
    { title : String
    }

view : (a -> msg) -> Details -> Browser.Document msg
view toMsg details =
    { title = details.title
    , body = 
        [ div [] [ text "Hello world" ]
        ]
    }