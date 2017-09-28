module Msg exposing (..)

import Model exposing (Todo, TodoList)
import Navigation exposing (Location)
import Http exposing (..)


type Msg 
    = AddTodo
    | AddTodoTitle String
    | AddTodoText String
    | GenerateNewEntry Int

    | EditTodo Int
    | EditTodoTitle String
    | EditTodoText String
    | EditTodoCompleted    

    | UpdateEditEntry Todo

    | RemoveTodo Int
    | CompleteTodo Int

    | OnFetchTodoList (Result Error TodoList)
    | OnFetchNewEntry (Result Error Todo)

    | OnEditTodoList (Result Error Todo)
    | OnAddTodoList (Result Error Todo)

    | OnLocationChange Location

    