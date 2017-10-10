module Command exposing (..)

import Http exposing (jsonBody)
import Model exposing (..)
import Msg exposing (..)
import Helper.HttpHelper exposing (httpGet, httpPut, httpPost)
import Helper.DecodeHelper exposing (todoDecoder, todoListDecoder, todoEncoder)

-- HTTP


-- Initial Request

fetchTodoList : Cmd Msg
fetchTodoList =
    httpGet
        "http://localhost:4000/todoList/"
        todoListDecoder
        FetchTodoListFail 
        FetchTodoListSuccess

fetchNewEntry : Cmd Msg
fetchNewEntry =
    httpGet 
        "http://localhost:4000/newEntry"
        todoDecoder
        FetchNewEntryFail 
        FetchNewEntrySuccess




-- HTTP POST REQUESTS 

addTodo : Todo -> Cmd Msg 
addTodo todo =
    httpPost
        "http://localhost:4000/todoList/"
        (Http.jsonBody (todoEncoder todo))        
        todoDecoder
        AddTodoListFail
        AddTodoListSuccess



editTodo : Todo -> Int -> Cmd Msg
editTodo todo id =
    httpPut
        ("http://localhost:4000/todoList/" ++ (toString id))
        (Http.jsonBody (todoEncoder todo))        
        todoDecoder
        EditTodoListFail
        EditTodoListSuccess


