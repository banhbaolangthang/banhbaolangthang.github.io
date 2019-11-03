module Home exposing (..)

import Browser

import Html exposing (..)

type Msg 
    = NoOp

type alias Model =
    {
    }

init : (Model, Cmd Msg)
init = 
    (Model, Cmd.none)