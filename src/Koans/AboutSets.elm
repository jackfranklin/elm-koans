module AboutSets where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (suite, test)
import Set
import TestHelpers exposing (..)


assertEqualSets set1 set2 = assertEqual (Set.toList set1) (Set.toList set2)


oneTwoThree = Set.fromList [1, 2, 3]


testSuite =
  suite
    "About Sets"
    [ test "a set can be created from a list"
        (assertEqualSets (Set.fromList [1, 2, 3]) (Set.fromList [1, 2, 3]))
    , test "a set cannot contain duplicates"
        (assertEqualSets (Set.fromList [1, 2, 3]) (Set.fromList [1, 2, 3, 3, 2, 1]))
    , test "sets may be empty"
        (assertEqualSets (Set.fromList []) Set.empty)
    , test "or contain a single value"
        (assertEqualSets (Set.fromList [0]) (Set.singleton 0))
    , test "insert may add a new element to a set"
        (assertEqualSets (Set.fromList [1, 2, 3, 4]) (Set.insert 4 oneTwoThree))
    , test "but may not add duplicates"
        (assertEqualSets (Set.fromList [1, 2, 3]) (Set.insert 1 oneTwoThree))
    , test "remove may subtract an element from a set"
        (assertEqualSets (Set.fromList [2, 3]) (Set.remove 1 oneTwoThree))
    , test "but only if it is there"
        (assertEqualSets (Set.fromList [1, 2, 3]) (Set.remove 4 oneTwoThree))
    , test "member can check if an element is in a set"
        (assertEqual True (Set.member 2 oneTwoThree))
    , test "union will add two sets"
        (assertEqualSets (Set.fromList [1, 2, 3, 4]) (Set.union oneTwoThree (Set.fromList [3, 4])))
    , test "intersect will get the intersection"
        (assertEqualSets (Set.fromList [3]) (Set.intersect oneTwoThree (Set.fromList [3, 4])))
    , test "diff is the difference between the first and second sets"
        (assertEqualSets (Set.fromList [2]) (Set.diff oneTwoThree (Set.fromList [1, 3])))
    ]
