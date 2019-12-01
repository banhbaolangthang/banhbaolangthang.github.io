module Web exposing (..)

import Browser

import Html exposing (..)
import Html.Lazy exposing (..)
import Html.Attributes exposing (..)

type alias Details msg = 
    { title : String
    , content : List (Html msg)
    }

view : (a -> msg) -> Details a -> Browser.Document msg
view toMsg details =
    { title = details.title
    , body = 
        [ Html.map toMsg <|
            div [ class "main" ] details.content
        ]
    }