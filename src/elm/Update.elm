module Update exposing (..)

import Model exposing (..)
import Msg exposing (..)
import Helper exposing (..)
import Command exposing (..)

import Random exposing (int, initialSeed, generate) 
import Routing exposing (parseLocation)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of

        
        -- ADD TODO 

        AddTodo ->
            { model | todoList = model.newEntry :: model.todoList } ! [Random.generate GenerateNewEntry (Random.int 1 6000000)] 
        
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

        

        -- EDIT TODO 

        EditTodo id -> 
            { model | todoList = List.map (setCompletedAtId id)  model.todoList } ! [editTodo model.todoList id]
        -- need to figure this one out. 

        EditTodoTitle inputValue ->
            (inputValue
            |> asEditTodoTitleIn model.editEntry
            |> asEditEntryIn model
            ) ! []
        
        EditTodoText inputValue ->
            (inputValue
            |> asEditTodoTextIn model.editEntry
            |> asEditEntryIn model
            ) ! []

        EditTodoCompleted ->
            let 
                editEntry = model.editEntry 
            in
                (not editEntry.completed
                |> asEditTodoCompletedIn model.editEntry
                |> asEditEntryIn model
                ) ! []

        UpdateEditEntry todo -> 
            { model | editEntry = todo } ! []



        -- COMPLETE/REMOVE TODO UPDATES 

        CompleteTodo id ->
            { model | todoList = List.map (setCompletedAtId id) model.todoList } ! []

        RemoveTodo id ->
            { model | todoList = List.filter (\x -> x.id /= id) model.todoList } ! []



        -- JSON RETRIEVE (GET) UPDATES 

        OnFetchTodoList result ->
            case result of 
                Ok response ->
                  { model | todoList = response } ! []

                Err error ->
                  { model | error = toString error } ! []


        OnFetchNewEntry result ->
            case result of 
                Ok response ->
                  { model | newEntry = response } ! []

                Err error ->
                  { model | error = toString error } ! []



        -- Post List 

        OnEditTodoList result -> 
            case result of 
                Ok response ->
                    model ! []

                Err error ->
                  { model | error = toString error } ! []

        
        OnAddTodoList result -> 
            case result of 
                Ok response ->
                    model ! []

                Err error ->
                  { model | error = toString error } ! []



        -- ROUTER UPDATES 

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                { model | route = newRoute } ! []

        
