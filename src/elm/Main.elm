module Main exposing (..)

import Model exposing (Model, initialModel)
import Msg exposing (..)
import View exposing (view)
import Update exposing (update)
import Command exposing (..)
import Routing

import Html exposing (..)

import Navigation exposing (Location)
import Http exposing (..)
import Json.Decode 
import Json.Decode.Pipeline exposing (decode, required)



main : Program Never Model Msg
main =
    Navigation.program OnLocationChange 
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Location -> (Model, Cmd Msg)
init location =
    let 
      currentRoute =
        Routing.parseLocation location
    in
      initialModel currentRoute ! [fetchTodoList, fetchNewEntry]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


