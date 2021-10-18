! =============================================================================
! MONTE CARLO ESTIMATION OF PI
! =============================================================================

PROGRAM MONTE_CARLO_PI
    IMPLICIT NONE
    ! DECLARATION
    REAL :: PI, X, Y, RADIUS
    INTEGER :: CNTR, MAXQ, QRYS
    ! EXECUTIONER
    CNTR = 0
    WRITE(*, '(A)', ADVANCE='NO') "ENTER MAX QUERIES : "
    READ(*, *) MAXQ

    DO QRYS = 1, MAXQ
        CALL RANDOM_SEED()
        CALL RANDOM_NUMBER(X)
        CALL RANDOM_NUMBER(Y)
        RADIUS = SQRT(X ** 2 + Y ** 2)
        IF (RADIUS < 1.0) CNTR = CNTR + 1
    END DO
    
    PI = 4.0 * REAL(CNTR) / REAL(MAXQ)
    PRINT *, CNTR, MAXQ
    PRINT *, "PI : ", PI
END PROGRAM MONTE_CARLO_PI
