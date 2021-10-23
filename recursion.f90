! =============================================================================
! RECURSION AND RECURSIVE FUNCTIONS
! =============================================================================


PROGRAM RECURSIVE_SUM_EXERCISE
    IMPLICIT NONE
    INTEGER, PARAMETER :: THE_NUMBERS(*) = [2, 3, 5, 7, 11]
    INTEGER :: ANSWER

    ANSWER = RECUR_SUM(THE_NUMBERS)

    IF (ANSWER == 28) THEN
        PRINT *, "YOU GOT IT! :)"
    ELSE
        PRINT *, ANSWER
        PRINT *, "NOT QUITE RIGHT YET. :("
    END IF
CONTAINS
    RECURSIVE FUNCTION SUM_(NUMBERS) RESULT(TOTAL)
    INTEGER, INTENT(IN) :: NUMBERS(:)
    INTEGER :: TOTAL
        IF (SIZE(NUMBERS) == 1) THEN
            TOTAL = NUMBERS(1)
            RETURN
        ELSE
            TOTAL = NUMBERS(1) + SUM_(NUMBERS(2:))
            RETURN
        END IF
    END FUNCTION SUM_
    RECURSIVE FUNCTION RECUR_SUM(NUMBERS) RESULT(TOTAL)
    INTEGER, INTENT(IN) :: NUMBERS(:)
    INTEGER :: TOTAL
        IF (SIZE(NUMBERS) == 1) THEN
            TOTAL = NUMBERS(1)
            RETURN
        ELSE
            TOTAL = RECUR_SUM(NUMBERS(1:SIZE(NUMBERS)/2)) &
                  + RECUR_SUM(NUMBERS(SIZE(NUMBERS)/2+1:))
            RETURN
        END IF
    END FUNCTION RECUR_SUM
END PROGRAM
