module Main exposing (..)

import Model exposing (Model, initialModel)
import Msg exposing (..)
import View exposing (view)
import Update exposing (update)
import Command exposing (..)


import Html exposing (..)


import Http exposing (..)
import Json.Decode 
import Json.Decode.Pipeline exposing (decode, required)



main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
    }


init : (Model, Cmd Msg)
init = 
    initialModel ! [fetchTodoList, fetchNewEntry]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


