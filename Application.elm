module Application where

import Html exposing (..)
import Html.Events exposing (on, onClick)
import Components
import SelectedComponents

type alias Model = 
    {
        components : List String,
        selectedComponents : List String
    }

type Action = ComponentsAction Components.Action

init : Model
init = 
    {
        components = ["component1", "component2", "component3"],
        selectedComponents = []
    }

update : Action -> Model -> Model
update action model = 
    case action of 
        ComponentsAction componentAction -> 
            case componentAction of            
                Components.Select name -> 
                    {
                        model |
                                components = Components.update componentAction model.components,
                                selectedComponents = SelectedComponents.update (SelectedComponents.AddComponent name) model.selectedComponents
                    }

view : Signal.Address Action -> Model -> Html
view address model = 
    div [] [Components.view (Signal.forwardTo address ComponentsAction) model.components, SelectedComponents.view model.selectedComponents]          