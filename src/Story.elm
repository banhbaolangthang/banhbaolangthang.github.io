module Story exposing (..)

type alias Data =
    { name : String
    , url : String
    , description : String
    }

empty : Data
empty = 
    Data "" "" ""