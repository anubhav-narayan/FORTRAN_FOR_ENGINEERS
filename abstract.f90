! =============================================================================
! ABSTRACT INTERFACES
! =============================================================================


MODULE REDUCE_M
    IMPLICIT NONE

    ABSTRACT INTERFACE
        PURE FUNCTION COMBINER(X, Y) RESULT(Z)
            INTEGER, INTENT(IN) :: X
            INTEGER, INTENT(IN) :: Y
            INTEGER :: Z
        END FUNCTION
    END INTERFACE
CONTAINS
    PURE RECURSIVE FUNCTION REDUCE(VALS, ACCUMULATOR, INIT) RESULT(COMBINED)
        INTEGER, INTENT(IN) :: VALS(:)
        PROCEDURE(COMBINER) :: ACCUMULATOR
        INTEGER, INTENT(IN) :: INIT
        INTEGER :: COMBINED

        IF (SIZE(VALS) == 1) THEN
            COMBINED = ACCUMULATOR(INIT, VALS(1))
        ELSE
            COMBINED = REDUCE(VALS(2:), ACCUMULATOR, &
                       ACCUMULATOR(INIT, VALS(1)))
        END IF
    END FUNCTION
END MODULE

PROGRAM MAIN
    USE REDUCE_M, ONLY: REDUCE

    IMPLICIT NONE

    INTEGER :: ANSWER

    ANSWER = SUM_([1, 2, 3, 4])

    IF (ANSWER == 10) THEN
        PRINT *, "YOU GOT IT! :)"
    ELSE
        PRINT *, ANSWER
        PRINT *, "NOT QUITE RIGHT YET. :("
    END IF
CONTAINS
    PURE FUNCTION SUM_(NUMBERS) RESULT(TOTAL)
    INTEGER, INTENT(IN) :: NUMBERS(:)
    INTEGER :: TOTAL
        TOTAL = REDUCE(NUMBERS, ADD, 0)
    END FUNCTION SUM_

    PURE FUNCTION ADD(X, Y)
    INTEGER, INTENT(IN) :: X, Y
    INTEGER :: ADD
        ADD = X + Y
    END FUNCTION ADD


END PROGRAM