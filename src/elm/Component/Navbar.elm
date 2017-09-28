module Component.Navbar exposing (..)

import Routing exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


navbar : Html msg
navbar =
    div [ ]  
        [ indexPagePathLink
        , text "this is the navigation menu" 
        ]



indexPagePathLink : Html msg 
indexPagePathLink =
    a [ href indexPagePath ]
      [ text "homepage" ]


