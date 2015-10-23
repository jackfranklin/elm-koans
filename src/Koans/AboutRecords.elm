module AboutRecords where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (suite, test)
import TestHelpers exposing (..)


point = { x = 1, y = 2 }


poly = { append a = a ++ a }


testSuite =
  suite
    "About Records"
    [ test "a record is a set of named fields"
        (assertEqual { x = 1, y = 2 } { x = 1, y = 2 })
    , test "you can access a field with dot notation"
        (assertEqual 1 point.x)
    , test "the dot notation may also be used as a function"
        (assertEqual 2 (.y { x = 1, y = 2 }))
    , test "fields may be added to a record"
        (assertEqual { x = 1, y = 2, z = 3 } { point | z = 3 })
    , test "fields may be removed from a record"
        (assertEqual { x = 0, y = 0 } { xRecord - z })
    , test "fields may be updated in one action"
        (assertEqual { x = 3, y = 2 } { point | x <- 3 })
    , test "fields may also be 'polymorphic'"
        (assertEqual "hihi" (poly.append "hi"))
    , test "polymorphic fields are functions"
        (assertEqual ["hi", "hi"] (poly.append ["hi"]))
    ]
