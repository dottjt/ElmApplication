module Command exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Http exposing (..)
import Model exposing (..)
import Msg exposing (..)

-- HTTP

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



