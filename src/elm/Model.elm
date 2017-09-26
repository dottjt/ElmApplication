module Model exposing (..)
-- MODEL

type alias Todo =
  { id : Int
  , text : String
  , title : String
  , completed : Bool
  }

type alias TodoList = List Todo

type alias Model =
    { todoList : TodoList
    , newEntry : Todo
    , error : String
    }


initialModel : Model
initialModel = 
    { todoList = []
    , newEntry = 
      { id = 1
      , text = ""
      , title = ""  
      , completed = False       
      }
    , error = ""
    }

