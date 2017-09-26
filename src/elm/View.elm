module View exposing (..) 

import Model exposing (..)
import Msg exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- VIEWS

view : Model -> Html Msg 
view model =
  div [ class "container" ]
      [ h1 [ class "application__title"] [ text "Elm Application" ]
      , div [ class "todo__container" ]
            [ addTodoComponent model
            , todoListComponent model.todoList
            ]
      ]

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

addTodoValidation : Todo -> Html Msg
addTodoValidation todo = 
  let
    (color, message) =
      if String.length todo.text <= 0 then
        ("red", "You need to write something")
      else
        ("green", "#Yolo") 
  in 
    div [ style [("color", color )]] [ text message ]



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
          [ h2 [ class completedClass ] [ text todo.title ]
          , h3 [ class completedClass ] [ text todo.text ]
          , h4 [ class completedClass ] [ text (toString todo.id) ]
          , div [ class "todo__checkbox__container"]
            [ input [ type_ "checkbox", checked todo.completed, onClick (CompleteTodo todo.id) ] []
            , h4 [] [ text "Completed?" ]
            ]
          , button [ class "removetodo__button", onClick (RemoveTodo todo.id) ] [ text "X" ]
          ]

