module Helper exposing (..)

import Model exposing (..)




-- ADD TODO HELPERS

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




-- TODO EDIT HELPERS

editTodoTitle : String -> Todo -> Todo
editTodoTitle newTitle todo =
  { todo | title = newTitle }

asEditTodoTitleIn : Todo -> String -> Todo
asEditTodoTitleIn =
  flip editTodoTitle 


editTodoText : String -> Todo -> Todo
editTodoText newText todo =
  { todo | text = newText }

asEditTodoTextIn : Todo -> String -> Todo
asEditTodoTextIn =
  flip editTodoText 


editTodoId : Int -> Todo -> Todo
editTodoId newId todo =
  { todo | id = newId }

asEditTodoIdIn : Todo -> Int -> Todo
asEditTodoIdIn =
  flip editTodoId 


editTodoCompleted : Bool -> Todo -> Todo
editTodoCompleted newCompleted todo =
  { todo | completed = newCompleted }

asEditTodoCompletedIn : Todo -> Bool -> Todo
asEditTodoCompletedIn =
  flip editTodoCompleted 


setEditEntry : Todo -> Model -> Model
setEditEntry newTodo model =
  { model | editEntry = newTodo}

asEditEntryIn : Model -> Todo -> Model
asEditEntryIn =
  flip setEditEntry 







-- TODO COMPLETE HELPER

setCompletedAtId : Int -> Todo -> Todo
setCompletedAtId todoID todo =
  if todo.id == todoID then
    { todo | completed = not todo.completed }
  else 
    todo

