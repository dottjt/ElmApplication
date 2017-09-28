module Todo.EditTodo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Msg exposing (..)
import Model exposing (..)
import Routing exposing (..)


editTodoPage : Model -> Int -> Html Msg
editTodoPage model id =
    div []
        [ editTodoComponent model.editEntry  ]

editTodoComponent : Todo -> Html Msg
editTodoComponent todo = 
    div [ class "edittodo__container"]
        [ h1 [  class "edittodo__container__title" ] [ text "Add Todo" ]
        , label [] [
          text "Todo Title",
          input [ class "edittodo__title", type_ "text", placeholder "", value todo.title, onInput EditTodoTitle ] []
        ]
        , label [] [
          text "Todo Text",
          input [ class "edittodo__text", type_ "text", placeholder "", value todo.text, onInput EditTodoText ] []
        ]
        , label [] [
          text "Todo Completed?",
          input [ class "edittodo__completed", type_ "checkbox", checked todo.completed, onClick EditTodoCompleted ] []
        ]
        , button [ class "edittodo__submit__buton", type_ "submit", onClick (EditTodo todo.id) ] 
                 [ a [ href indexPagePath ] [ text "Edit Todo" ] ]
        ]

