import Browser
import Http

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

main =
    Browser.element
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

view : Model -> Html Msg
view model =
    text "Hello world"