module AboutAsserts where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (suite, test)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Asserts"
    [ test "assert tests for a true value"
        (assert True)
    , test "assertEqual tests for equality"
        (assertEqual True True)
    , test "assertNotEqual tests for inequality"
        (assertNotEqual False True)
    ]
