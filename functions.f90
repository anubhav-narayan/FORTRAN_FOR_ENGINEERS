! =============================================================================
! FUNCTIONAL PROGRAMMING IN FORTRAN
! =============================================================================


PROGRAM  PURE_AND_ELEMENTAL_EXERCISE
    IMPLICIT NONE
    INTEGER, PARAMETER :: PRIMES(*) = [2, 3, 5, 7, 11]
    INTEGER, PARAMETER :: REAL_ANSWER = 1872
    INTEGER :: ANSWER
    ANSWER = SUM(MUL_3(PRIMES))

    IF (ANSWER == REAL_ANSWER) THEN
        PRINT *, "YOU GOT IT! :)"
    ELSE
        PRINT *, ANSWER
        PRINT *, "NOT PASSING YET :("
    END IF
CONTAINS
    ! PUT YOUR FUNCTIONS DOWN HERE
    ELEMENTAL FUNCTION MUL_3(NUMBER)
    INTEGER, INTENT(IN) :: NUMBER
    INTEGER :: MUL_3
        MUL_3 = (NUMBER * 3) ** 2
    END FUNCTION MUL_3
END PROGRAM
