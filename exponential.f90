! =============================================================================
! CALCULATING THE EXPONENTIAL SERIES
! =============================================================================

PROGRAM EXPONENTIAL
    IMPLICIT NONE
    ! DECLARATION
    REAL :: X, E_X, NXT
    INTEGER :: I, TERMS
    E_X = 1.0
    ! EXECUTIONER
    WRITE(*, '(A)', ADVANCE='NO') &
         "EXPONENT : "
    READ(*, *) X
    NXT = X
    WRITE(*, '(A)', ADVANCE='NO') &
         "TERMS(2 - 50) : "
    READ(*, *) TERMS
    IF (TERMS > 50) TERMS = 50
    IF (TERMS < 2) TERMS = 2
    DO I = 2, TERMS
        E_X = E_X + NXT
        NXT = NXT * (X / REAL(I))
    END DO

    PRINT *, "AT ", TERMS, " TERMS ", &
          "E^", X, " = ", E_X
    PRINT *, EXP(X)
    PRINT *, "ERROR : ", ABS(EXP(X) - E_X)
END PROGRAM EXPONENTIAL
