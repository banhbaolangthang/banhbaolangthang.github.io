module NotFound exposing (..)

import Web
import Story

import Html exposing (..)

type alias Model =
    { story: Story.Data
    }

type Msg
    = NoOp

init : Story.Data -> (Model, Cmd Msg)
init story =
    ( { story = story }
    , Cmd.none
    )

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
    (model, Cmd.none)

view : Model -> Web.Details Msg
view model = 
    { title = "Banhbaolangthang - NotFound"
    , content = 
        [ div [] 
            [ text "NotFound"
            ]
        ]
    }