module Update exposing (..)

import Model exposing (..)
import Msg exposing (..)
import Helper exposing (..)

import Random exposing (int, initialSeed, generate) 


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of

        AddTodo ->
            ( { model | todoList = model.newEntry :: model.todoList }, Random.generate GenerateNewEntry (Random.int 1 6000000) )
        
        GenerateNewEntry newId ->
            (model.newEntry
            |> setTodoText ""
            |> setTodoTitle ""
            |> setTodoId newId
            |> asNewEntryIn model
            ) ! []

        AddTodoTitle inputValue ->
            (inputValue
            |> asTodoTitleIn model.newEntry
            |> asNewEntryIn model 
            ) ! []

        AddTodoText inputValue ->
            (inputValue 
            |> asTodoTextIn model.newEntry
            |> asNewEntryIn model
            ) ! []

        CompleteTodo id ->
            { model | todoList = List.map (setCompletedAtId id) model.todoList } ! []

        RemoveTodo id ->
            { model | todoList = List.filter (\x -> x.id /= id) model.todoList } ! []


        OnFetchTodoList (Ok response) ->
                  { model | todoList = response } ! []

        OnFetchTodoList (Err error) ->
                  { model | error = toString error } ! []



        OnFetchNewEntry (Ok response) ->
                  { model | newEntry = response } ! []

        OnFetchNewEntry (Err error) ->
                  { model | error = toString error } ! []


