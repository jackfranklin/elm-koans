module AboutTime where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (suite, test)
import TestHelpers exposing (..)
import Time


testSuite =
  suite
    "About Time"
    [ test "time is just a Float"
        (assertEqual 123.45 123.45)
    , test "a constant exists for hour"
        (assertEqual (60 * 60 * 1000) (1 * Time.hour))
    , test "and minute"
        (assertEqual (1000 * 60) (1 * Time.minute))
    , test "and second"
        (assertEqual 1000 (1 * Time.second))
    , test "and millisecond"
        (assertEqual 1 (1 * Time.millisecond))
    , test "helpers exist to convert back to Floats"
        (assertEqual 1 (Time.inSeconds 1000))
    ]
