module Todo.TodoList exposing (..)

import Model exposing (..)
import Msg exposing (..)
import Routing exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)




-- TODO LIST 

todoListComponent : TodoList -> Html Msg
todoListComponent todoList =
  div [ class "todolist__container"]
      [ h1 [] [ text "Todo List"]
      , div [] (List.map todoComponent todoList)
      ]


todoComponent : Todo -> Html Msg
todoComponent todo = 
      let completedClass =
          if todo.completed then
            "strikethrough"
          else 
            ""
      in
        div [ class "todo__component__container"]
          [ h2 [ class completedClass, onClick (UpdateEditEntry todo) ] 
               [ 
                 editTodoPageLink todo.id 
               ]
          , h3 [ class completedClass ] [ text todo.text ]
          , h4 [ class completedClass ] [ text (toString todo.id) ]
          , div [ class "todo__checkbox__container"]
            [ input [ type_ "checkbox", checked todo.completed, onClick (CompleteTodo todo.id) ] []
            , h4 [] [ text "Completed?" ]
            ]
          , button [ class "removetodo__button", onClick (RemoveTodo todo.id) ] [ text "X" ]
          ]



editTodoPageLink : Int -> Html msg 
editTodoPageLink todoId =
    a [ href (individualTodoPath todoId) ]
      [ text (toString todoId) ]

