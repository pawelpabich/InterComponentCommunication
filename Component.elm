module Component where

import Html exposing (..)

type alias Model = String

view : Model -> Html
view model = 
    div [] [ text model ]
          