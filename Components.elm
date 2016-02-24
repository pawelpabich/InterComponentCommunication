module Components where

import Html exposing (..)
import Html.Events exposing (on, onClick)
import Component
import Time

type alias Model = List String

type Action = Select String

update : Action -> Model -> Model
update action model = 
    case action of 
        Select name ->  List.filter (\c -> c /= name ) model

view : Signal.Address Action -> Model -> Html
view address model = 
    section [] ((h1 [] [text "Components"]) :: (List.map (\c -> div [] [(Component.view c), (button [onClick address (Select c)] [text "Select"])]) model))
          