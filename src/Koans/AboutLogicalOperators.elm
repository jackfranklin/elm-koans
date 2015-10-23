module AboutLogicalOperators where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (suite, test)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Logical Operators"
    [ test "not negates a boolean"
        (assertEqual False (not True))
    , test "&& is a logical AND"
        (assert (True && True))
    , test "|| is a logical OR"
        (assert (False || True))
    , test "xor is a logical XOR"
        (assert (False `xor` True))
    , test "otherwise is an alias for True"
        (assertEqual otherwise True)
    ]
