*** Settings ***
Documentation     I want to move my character. If they attempt to move past a boundary, the move results in no change in position. Test start of game. Let's play \n\n 
Test Template     Move character
Library           MoveLibrary.py

*** Test Cases ***                  StartingX     StartingY     StartingMoveCount     Direction     EndingX     EndingY     EndingMoveCount
Move in the middle of the board     0             0             1                     NORTH         0           1           2
Move on the edge of the board       0             0             5                     SOUTH         0           0           6
Test3                               0             9             3                     SOUTH         0           8           4
Test4                               9             9             5                     EAST          9           9           6
Test5                               9             0             7                     WEST          8           0           8
Test6                               5             5             9                     NORTH         5           6           10
Test7                               5             9             11                    SOUTH         5           8           12
Test8                               9             4             13                    EAST          9           4           14
Test9                               4             0             15                    WEST          3           0           16
Test10                              0             5             17                    NORTH         0           6           18
Test11                              0             1             19                    SOUTH         0           0           20
Test12                              5             7             21                    EAST          6           7           22
Test13                              2             7             23                    WEST          1           7           24
Test14                              7             9             25                    NORTH         7           9           26
Test15                              3             5             27                    SOUTH         3           4           28
Test16                              1             3             29                    EAST          2           3           30
Test17                              8             2             31                    WEST          7           2           32
Test18                              6             4             33                    NORTH         6           5           34
Test19                              6             6             35                    SOUTH         6           5           36

*** Keywords ***
Move character
    [Arguments]    ${startingX}    ${startingY}    ${startingMoveCount}    ${direction}    ${endingX}    ${endingY}    ${endingMoveCount}
    Initialize character xposition with  ${startingX}
    Initialize character yposition with  ${startingY}
    Initialize character moveCount with  ${startingMoveCount}
    Move in direction                    ${direction}
    Character xposition should be        ${endingX}
    Character yposition should be        ${endingY}
    Character moveCount should be        ${endingMoveCount}