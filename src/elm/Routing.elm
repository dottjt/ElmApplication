module Routing exposing (..)

import Model exposing (Route(..))

import Navigation exposing (Location)
import UrlParser exposing (..)

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map IndexPage top
        , map IndividualTodoPage (s "todo" </> int)
        , map IndexPage (s "todolist")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of 
        Just route ->
            route
        
        Nothing ->
            NotFoundRoute 


indexPagePath : String
indexPagePath =
    "#"


individualTodoPath : Int -> String 
individualTodoPath id =
    "#todo/" ++ (toString id)


