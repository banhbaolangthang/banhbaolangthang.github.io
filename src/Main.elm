import Browser exposing (Document)
import Browser.Navigation as Nav

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Http
import Url

main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }

type Msg
    = NoOp
    | UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest

type Model
    = Ready

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init flags url key =
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