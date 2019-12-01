module NotFound exposing (..)

import Web
import Story

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

view : Model -> Web.Details
view model = 
    { title = "Banhbaolangthang - NotFound"
    }