port module Main exposing (main)

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
    | OnShare String


port copyToClipboard : String -> Cmd msg


cursorPos =
    ( 3, 4 )


defaultGuess =
    [ "The quick brown fox", "jumped over", "the lazy dog.", " The quick brown fox jumped", " over the lazy dog." ]


init : Int -> ( { day : Int, guess : String, guesses : List b, shared : Bool }, Cmd msg )
init day =
    ( { day = day
      , guess = String.join "\n" defaultGuess
      , guesses = []
      , shared = False
      }
    , Cmd.none
    )


view { day, guess, guesses, shared } =
    let
        ( vimle, answer ) =
            Array.get day Data.data
                |> Maybe.withDefault ( "UNDEFINED", [] )

        game =
            Element.column []
                [ Element.row [ Element.spacing 20, Element.paddingXY 0 40 ]
                    [ viewQuick
                    , Element.column [ Element.width Element.fill ]
                        [ viewInput { guess = guess }
                        , Element.Input.button
                            [ Element.alignRight
                            ]
                            { onPress = Just OnSubmit
                            , label =
                                Element.el
                                    [ Element.Background.color black
                                    , Element.Font.color white
                                    ]
                                <|
                                    Element.text "Guess!"
                            }
                        ]
                    ]
                ]
    in
    Element.layout
        [ Element.Font.family [ Element.Font.typeface "consolas", Element.Font.monospace ]
        , Element.Font.italic
        , Element.paddingEach { top = 36, bottom = 0, left = 0, right = 0 }
        ]
    <|
        Element.column [ Element.spacing 16, Element.centerX ]
            [ Element.el [ Element.centerX ] <| Element.text <| "Vimle #" ++ String.fromInt day
            , Element.el [ Element.centerX ] <| Element.text vimle
            , case guesses of
                [] ->
                    game

                latestGuess :: _ ->
                    if latestGuess == answer || List.length guesses == 6 then
                        Element.row
                            [ Element.spacing 10 ]
                            [ viewStatus { guesses = guesses, answer = answer }
                            , viewShareButton { answer = answer, guesses = guesses, day = day } shared
                            ]

                    else
                        game
            , viewGuesses { guesses = guesses, answer = answer }
            ]


viewGuesses { guesses, answer } =
    Element.column [ Element.spacing 10 ] <| List.map (viewGuess answer) guesses


viewGuess answer guess =
    guess
        |> List.map2 Tuple.pair (List.range 1 (List.length defaultGuess))
        |> List.map2 viewGuessLine (answer ++ List.repeat 10 "__________")
        |> Element.column []


viewStatus { guesses, answer } =
    case guesses of
        final :: _ ->
            Element.el [] <|
                Element.text <|
                    if final == answer then
                        case List.length guesses of
                            1 ->
                                "Flawless!"

                            2 ->
                                "Incredible!"

                            3 ->
                                "Nice one!"

                            4 ->
                                "Well done!"

                            5 ->
                                "Well done!"

                            6 ->
                                "Phew!"

                            _ ->
                                "????"

                    else
                        "Bad luck!"

        [] ->
            Element.none


viewInput { guess } =
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
        |> Element.column [ Element.alignTop ]


black =
    Element.rgb255 0 0 0


grey =
    Element.rgb255 130 130 130


green =
    Element.rgb255 100 170 100


orange =
    Element.rgb255 220 180 80


white =
    Element.rgb255 255 255 255


viewGuessLine answerLine ( no, line ) =
    let
        ( cursorLine, cursorCol ) =
            cursorPos
    in
    Element.el
        [ Element.Background.color
            (if line == answerLine then
                green

             else if close line answerLine then
                orange

             else
                grey
            )
        , Element.Font.color white
        ]
    <|
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
            [ pre (String.fromInt no ++ ". " ++ String.left cursorCol line)
            , Element.el [ Element.Background.color black, Element.Font.color white ] <| pre (String.slice cursorCol (cursorCol + 1) line)
            , pre (String.dropLeft (cursorCol + 1) line)
            ]

    else
        Element.text <| String.fromInt no ++ ". " ++ line


viewShareButton guesses copied =
    Element.Input.button []
        { onPress = Just <| OnShare (getSharable guesses)
        , label =
            Element.text <|
                if copied then
                    "copied!"

                else
                    "share"
        }


getSharable { guesses, answer, day } =
    let
        score =
            case guesses of
                guess :: _ ->
                    if guess == answer then
                        String.fromInt (List.length guesses)

                    else
                        "X"

                _ ->
                    "???"

        title =
            "Vimle " ++ String.fromInt day ++ " " ++ score ++ "/6\n"
    in
    title ++ (String.join "\n" <| List.map (asEmoji answer) (List.reverse guesses))


asEmoji answer guess =
    String.fromList <| customMap2 "!!!!!!!!!!!" isOk answer guess


customMap2 : a -> (a -> a -> result) -> List a -> List a -> List result
customMap2 u f listA listB =
    case ( listA, listB ) of
        ( [], [] ) ->
            []

        ( x :: xs, [] ) ->
            f x u :: customMap2 u f xs []

        ( [], y :: ys ) ->
            f u y :: customMap2 u f [] ys

        ( x :: xs, y :: ys ) ->
            f x y :: customMap2 u f xs ys


close real attempt =
    String.contains attempt real || String.contains real attempt


isOk attempt real =
    if attempt == real then
        '🟩'

    else if close real attempt then
        '🟨'

    else
        '⬜'


update msg model =
    case msg of
        GuessChange guess ->
            ( { model | guess = guess }, Cmd.none )

        OnSubmit ->
            ( { model | guesses = String.split "\n" model.guess :: model.guesses }, Cmd.none )

        OnShare txt ->
            ( { model | shared = True }, copyToClipboard txt )


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


pre text =
    Element.text text
