module View exposing (..) 

import Model exposing (..)
import Msg exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


import Todo.TodoList exposing (..)
-- import Todo.AddTodo exposing (..)
import Todo.EditTodo exposing (editTodoPage)

import Component.NotFoundView exposing (notFoundView)
import Component.Navbar exposing (navbar)
-- VIEWS

view : Model -> Html Msg 
view model =
  div [ class "container" ]
      [ h1 [ class "application__title"] [ text "Elm Application" ]
      , navbar
      , div [ class "todo__container" ]
            [ page model ]
      ]


page : Model -> Html Msg
page model =
  case model.route of

    IndexPage ->
      todoListComponent model.todoList
      
    IndividualTodoPage id ->
      editTodoPage model id

    NotFoundRoute ->
      notFoundView