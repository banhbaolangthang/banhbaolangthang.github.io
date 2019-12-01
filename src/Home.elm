module Home exposing (..)

import Browser
import Web

import Html exposing (..)

type Msg 
    = NoOp

type alias Model =
    {
    }

init : (Model, Cmd Msg)
init = 
    (Model, Cmd.none)

empty : Model
empty =
    {}

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    (model, Cmd.none)

view : Model -> Web.Details
view model =
    { title = "Banhbaolangthang - Home"
    }