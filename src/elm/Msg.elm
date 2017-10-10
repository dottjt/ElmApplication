module Msg exposing (..)

import Model exposing (Todo, TodoList)
import Navigation exposing (Location)
import Http exposing (Error)


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
    
    | FetchTodoListFail Error
    | FetchTodoListSuccess TodoList 
    | FetchNewEntryFail Error 
    | FetchNewEntrySuccess Todo 

    | EditTodoListFail Error
    | EditTodoListSuccess Todo
    | AddTodoListFail Error
    | AddTodoListSuccess Todo

    | OnLocationChange Location

    