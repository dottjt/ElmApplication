module Todo.AddTodo exposing (..)

import Model exposing (..)
import Msg exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)





-- ADD TODO COMPONENT

addTodoComponent : Model -> Html Msg
addTodoComponent model =
  let
    newEntry = model.newEntry 
  in 
  div [ class "addtodo__container" ]
       [ h1 [  class "addtodo__container__title" ] [ text "Add Todo" ]
       , label [] [
         text "Todo Title",
         input [ class "addtodo__title", type_ "text", placeholder "", value newEntry.title, onInput AddTodoTitle ] []
       ]
       , label [] [
         text "Todo Text",
         input [ class "addtodo__text", type_ "text", placeholder "", value newEntry.text, onInput AddTodoText ] []
       ]
       , button [ class "addtodo__submit__buton", type_ "submit", onClick AddTodo  ] [ text "Add Me Pleaseeeee"]
       ]

addTodoValidation : Todo -> Html msg
addTodoValidation todo = 
  let
    (color, message) =
      if String.length todo.text <= 0 then
        ("red", "You need to write something")
      else
        ("green", "#Yolo") 
  in 
    div [ style [("color", color )]] [ text message ]

