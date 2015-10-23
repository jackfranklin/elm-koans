module AboutNumberConversions where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (suite, test)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Number Conversions"
    [ test "toFloat converts an int to a float"
        (assertEqual 5.0 (toFloat 5))
    , test "floor converts an float to a int (rounding down)"
        (assertEqual 3 (floor 3.6))
    , test "floor converts an float to a int (rounding down)"
        (assertEqual -4 (floor -3.6))
    , test "ceiling converts an float to a int (rounding up)"
        (assertEqual 4 (ceiling 3.6))
    , test "ceiling converts an float to a int (rounding up)"
        (assertEqual -3 (ceiling -3.6))
    , test "round converts an float to a int (rounding to the closest int)"
        (assertEqual 4 (round 3.6))
    , test "round converts an float to a int (rounding to the closest int)"
        (assertEqual -4 (round -3.6))
    , test "truncate converts an float to a int (rounding towards 0)"
        (assertEqual 3 (truncate 3.6))
    , test "truncate converts an float to a int (rounding towards 0)"
        (assertEqual -3 (truncate -3.6))
    ]
