module Main exposing (..)

import Browser exposing (Document)
import Browser.Navigation as Nav

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Http
import Url
import Url.Parser as Parser exposing (Parser, (</>), custom, fragment, map, oneOf, s, top)

import Web
import Home
import Story
import NotFound

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
    | NotFoundMsg NotFound.Msg

type Page
    = NotFound NotFound.Model
    | Home Home.Model

type alias Model =
    { page : Page
    , navKey : Nav.Key
    }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init flags url key =
    stepUrl 
        url
        { navKey = key
        , page = Home (Home.empty)
        }

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        LinkClicked urlRequest -> 
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl model.navKey (Url.toString url)
                    )
                
                Browser.External url ->
                    ( model
                    , Nav.load url
                    )

        UrlChanged url ->
            stepUrl url model

        HomeMsg submsg ->
            case model.page of
                Home home -> stepHome model (Home.update submsg home)
                _         -> (model, Cmd.none)

        NotFoundMsg submsg ->
            case model.page of
                NotFound notFound   -> stepNotFound model (NotFound.update submsg notFound)
                _                   -> (model, Cmd.none)

        NoOp ->
            (model, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

view : Model -> Document Msg
view model =
    case model.page of
        Home home ->
            Web.view HomeMsg (Home.view home)

        NotFound notFound ->
            Web.view NotFoundMsg (NotFound.view notFound)

-- router

route : Parser a b -> a -> Parser (b -> c) c
route parser handler =
    Parser.map handler parser

stepHome : Model -> (Home.Model, Cmd Home.Msg) -> (Model, Cmd Msg)
stepHome model (home, cmds) =
    ( { model | page = Home home }
    , Cmd.map HomeMsg cmds
    )

stepNotFound : Model -> (NotFound.Model, Cmd NotFound.Msg) -> (Model, Cmd Msg)
stepNotFound model (notFound, cmds) =
    ( { model | page = NotFound notFound }
    , Cmd.none
    )

stepUrl : Url.Url -> Model -> (Model, Cmd Msg)
stepUrl url model =
    let
        story = 
            Story.empty

        parser = 
            oneOf
                [ route top
                    ( stepHome model (Home.init)
                    )
                ]
    in
        case Parser.parse parser url of
            Just answer ->
                answer

            Nothing ->
                stepNotFound model (NotFound.init story)
