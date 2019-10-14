import Browser exposing (Document)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Http

main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

type Msg
    = NoOp

type Model
    = Ready

init : () -> (Model, Cmd Msg)
init _ =
    (Ready, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    (Ready, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

view : Model -> Document Msg
view model =
    { title = "Banh bao lang thang"
    , body = [ div [] [ text "Hello world" ] ]
    }