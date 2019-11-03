import Browser exposing (Document)
import Browser.Navigation as Nav

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Http
import Url

import Web
import Home
import Story

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
    | HomeMsg Home.Msg

type Page
    = NotFound Story.Data
    | Home Home.Model

type alias Model =
    { page : Page
    , navKey : Nav.Key
    }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init flags url key =
    ( { page = Home {}
      , navKey = key
      }
    , Cmd.none
    )

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    (model, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

view : Model -> Document Msg
view model =
    Web.view HomeMsg { title = "Banh bao lang thang" } 