module AboutRegexes where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (suite, test)
import Regex
import String
import TestHelpers exposing (..)


testSuite =
  suite
    "About Regex"
    [ test "contains tests for a regex match"
        (assertEqual True (Regex.contains (Regex.regex "[abc]+") "abcdefg"))
    , test "escape will escape all special characters"
        (assertEqual "\\[abc\\]\\+" (Regex.escape "[abc]+"))
    , test "useful for matching strange strings"
        (assertEqual True (Regex.contains (Regex.regex (Regex.escape "[eir]+")) "w[eir]+d"))
    , test "it's easy to make your regex case insensitive"
        (assertEqual True (Regex.contains (Regex.caseInsensitive (Regex.regex "abc")) "ABC"))
    , test "find returns a list of all matches"
        (assertEqual 3 (Regex.find Regex.All (Regex.regex "abc") "abcabcabc" |> List.length))
    , test "matches contain the match"
        (assertEqual ["a", "b", "c"] (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match)))
    , test "matches contain the index"
        (assertEqual [0, 2, 4] (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.index)))
    , test "matches may contain submatches"
        (assertEqual [[Just "a", Nothing], [Nothing, Just "b"]] (Regex.find Regex.All (Regex.regex "(a)|(b)") "axbxc" |> List.map (\match -> match.submatches)))
    , test "you may limit the number of matches"
        (assertEqual ["a", "b"] (Regex.find (Regex.AtMost 2) (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match)))
    , test "replace can modify based on the match"
        (assertEqual "AxBxC" (Regex.replace Regex.All (Regex.regex "[abc]") (\match -> String.toUpper match.match) "axbxc"))
    ]

