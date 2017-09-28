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
    , editEntry : Todo
    , error : String
    , route : Route
    }


type Route
  = IndexPage 
  | IndividualTodoPage Int
  | NotFoundRoute 



-- Before, was just Model
initialModel : Route -> Model
initialModel route = 
    { todoList = []
    , newEntry = 
      { id = 0
      , text = ""
      , title = ""  
      , completed = False       
      }
    , editEntry =
      { id = 0
      , text = ""
      , title = ""
      , completed = False
      }
    , error = ""
    , route = route
    }

