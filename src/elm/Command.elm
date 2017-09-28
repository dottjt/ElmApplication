module Command exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)

import Json.Encode exposing (..)

import Http exposing (..)
import Model exposing (..)
import Msg exposing (..)

-- HTTP


-- HTTP GET REQUESTS

fetchTodoList : Cmd Msg
fetchTodoList =
    Http.get "http://localhost:4000/todoList" todoListDecoder
      |> Http.send OnFetchTodoList

fetchNewEntry : Cmd Msg
fetchNewEntry =
    Http.get "http://localhost:4000/newEntry" todoDecoder
      |> Http.send OnFetchNewEntry


todoListDecoder : Json.Decode.Decoder TodoList
todoListDecoder =
    Json.Decode.list todoDecoder


todoDecoder : Json.Decode.Decoder Todo
todoDecoder =
    Json.Decode.Pipeline.decode Todo
        |> Json.Decode.Pipeline.required "id" Json.Decode.int
        |> Json.Decode.Pipeline.required "title" Json.Decode.string
        |> Json.Decode.Pipeline.required "text" Json.Decode.string
        |> Json.Decode.Pipeline.required "completed" Json.Decode.bool



-- HTTP POST REQUESTS 


editTodo : Todo -> Int -> Cmd Msg
editTodo todo id =
    let
        url = "http://localhost:4000/todoList/" ++ (toString id)
        body = (encodeTodo todo)
        request = Http.update url body todoDecoder
    in
       Http.send OnEditTodoList request



encodeTodo : Todo -> Http.Body
encodeTodo todo =
    Http.jsonBody <| 
        Json.Encode.object [ ("text", Json.Encode.string todo.text) 
                           , ("title", Json.Encode.string todo.title)
                           , ("completed", Json.Encode.bool todo.completed)
                           , ("id", Json.Encode.int todo.id)]




addTodo : Todo -> Cmd Msg 
addTodo todo =
    let
        url = "http://localhost:4000/todoList/"
        body = (encodeTodo todo)
        request = Http.post url body todoDecoder
    in
       Http.send OnAddTodoList request




-- encodeTodoList : TodoList -> Http.Body
-- encodeTodoList todoList =
--     Json.Encode.list (encodeTodo todoList)
