module Main exposing (main)

import Array
import Browser
import Data
import Element
import Element.Background
import Element.Font
import Element.Input


type Msg
    = GuessChange String
    | OnSubmit


cursorPos =
    ( 1, 0 )


defaultGuess =
    [ "The quick brown fox", "  jumped over", " the lazy dog.", "  The quick", "    brown fox jumped", "    over the lazy", "   dog." ]


init =
    { day = 1
    , guess = String.join "\n" defaultGuess
    , guesses = [ [] ]
    }


view { day, guess, guesses } =
    let
        ( vimle, answer ) =
            Array.get day Data.data
                |> Maybe.withDefault ( "UNDEFINED", [] )
    in
    Element.layout [ Element.Font.family [ Element.Font.monospace ] ] <|
        Element.column []
            [ Element.text <| "Vimle #" ++ String.fromInt day ++ " " ++ vimle
            , Element.row []
                [ viewQuick
                , viewGuess { guess = guess }
                ]
            , Element.Input.button [] { onPress = Just OnSubmit, label = Element.el [ Element.Background.color black, Element.Font.color white ] <| Element.text "Guess!" }
            , viewGuesses { guesses = guesses, answer = answer }
            ]


viewGuesses { guesses, answer } =
    case guesses of
        [] ->
            Element.none

        guess :: _ ->
            guess
                |> List.map2 Tuple.pair (List.range 1 (List.length defaultGuess))
                |> List.map2 viewGuessLine (answer ++ List.repeat 10 "__________")
                |> Element.column []


viewGuess { guess } =
    Element.Input.multiline []
        { onChange = GuessChange
        , text = guess
        , placeholder = Nothing
        , label = Element.Input.labelHidden "guess"
        , spellcheck = False
        }


viewQuick =
    defaultGuess
        |> List.map2 Tuple.pair (List.range 1 (List.length defaultGuess))
        |> List.map viewQuickLine
        |> Element.column []


black =
    Element.rgb 0.1 0.1 0.1


red =
    Element.rgb 0.9 0.1 0.1


green =
    Element.rgb 0.1 0.9 0.1


white =
    Element.rgb 0.9 1 1


viewGuessLine answerLine ( no, line ) =
    let
        ( cursorLine, cursorCol ) =
            cursorPos
    in
    if line == answerLine then
        Element.el [ Element.Background.color green, Element.Font.color white ] <|
            Element.text <|
                String.fromInt no
                    ++ ". "
                    ++ line

    else
        Element.el [ Element.Background.color red, Element.Font.color white ] <|
            Element.text <|
                String.fromInt no
                    ++ ". "
                    ++ line


viewQuickLine ( no, line ) =
    let
        ( cursorLine, cursorCol ) =
            cursorPos
    in
    if cursorLine == no then
        Element.paragraph []
            [ Element.text (String.fromInt no ++ ". ")
            , Element.text (String.left cursorCol line)
            , Element.el [ Element.Background.color black, Element.Font.color white ] <| Element.text (String.slice cursorCol (cursorCol + 1) line)
            , Element.text (String.dropLeft (cursorCol + 1) line)
            ]

    else
        Element.text <| String.fromInt no ++ ". " ++ line


update msg model =
    case msg of
        GuessChange guess ->
            { model | guess = guess }

        OnSubmit ->
            { model | guesses = String.split "\n" model.guess :: model.guesses }


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }
