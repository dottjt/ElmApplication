module Helper exposing (..)

import Model exposing (..)

setTodoTitle : String -> Todo -> Todo
setTodoTitle newTitle todo =
  { todo | title = newTitle }

asTodoTitleIn : Todo -> String -> Todo
asTodoTitleIn =
  flip setTodoTitle 

setTodoText : String -> Todo -> Todo
setTodoText newText todo =
  { todo | text = newText }

asTodoTextIn : Todo -> String -> Todo
asTodoTextIn =
  flip setTodoText 

setTodoId : Int -> Todo -> Todo
setTodoId newId todo =
  { todo | id = newId }

asTodoIdIn : Todo -> Int -> Todo
asTodoIdIn =
  flip setTodoId 

setNewEntry : Todo -> Model -> Model
setNewEntry newTodo model =
  { model | newEntry = newTodo}

asNewEntryIn : Model -> Todo -> Model
asNewEntryIn =
  flip setNewEntry 


setCompletedAtId : Int -> Todo -> Todo
setCompletedAtId todoID todo =
  if todo.id == todoID then
    { todo | completed = not todo.completed }
  else 
    todo