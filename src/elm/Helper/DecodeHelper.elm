module Helper.DecodeHelper exposing (..)

import Model exposing (..)

import Http exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode exposing (..)



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



todoEncoder : Todo -> Http.Body
todoEncoder todo =
    Http.jsonBody <| 
        Json.Encode.object [ ("text", Json.Encode.string todo.text) 
                           , ("title", Json.Encode.string todo.title)
                           , ("completed", Json.Encode.bool todo.completed)
                           , ("id", Json.Encode.int todo.id)]
