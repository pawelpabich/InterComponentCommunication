module SelectedComponents where

import Html exposing (..)
import Component
import Time

type alias Model = List String

type Action = AddComponent String

update : Action -> Model -> Model
update action model = 
    case action of 
        AddComponent name -> name :: model

view : Model -> Html
view model = 
    section [] ((h1 [] [text "Selected Components"]) :: (List.map Component.view model))
          