! =============================================================================
!  PROGRAM TO SUM VALUES IN AN ARRAY
! =============================================================================
PROGRAM SUMMATION
    IMPLICIT NONE
    INTEGER, PARAMETER :: N=10
    REAL, DIMENSION(N) :: VALUES
    REAL :: SUM
    VALUES=(/ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 /)
    CALL INTEGRATE(N, VALUES, SUM)
    PRINT '(A, F10.4)', ' The sum of the elements is: ',SUM
END PROGRAM SUMMATION

SUBROUTINE INTEGRATE(N, NUMBERS, SUM)
IMPLICIT NONE
REAL, INTENT(OUT) :: SUM
REAL, INTENT(IN) :: NUMBERS(N)
INTEGER, INTENT(IN) :: N
    INTEGER :: I
    SUM = 0
    DO I = 1, N
        SUM = SUM + NUMBERS(I)
    END DO
    RETURN
END SUBROUTINE INTEGRATE
