module Msg exposing (..)

import Model exposing (Todo, TodoList)

import Http exposing (..)


type Msg 
    = AddTodo
    | AddTodoTitle String
    | AddTodoText String
    | GenerateNewEntry Int
    
    | RemoveTodo Int
    | CompleteTodo Int

    | OnFetchTodoList (Result Error TodoList)
    | OnFetchNewEntry (Result Error Todo)