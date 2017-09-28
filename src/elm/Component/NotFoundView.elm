module Component.NotFoundView exposing (..)

import Html exposing (..)

import Msg exposing (..)


notFoundView : Html Msg
notFoundView =
    div []
        [ text "There is nothing here" ]

