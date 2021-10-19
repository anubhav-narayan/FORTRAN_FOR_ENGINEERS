! =============================================================================
! TEMP IN L-SHAPED DOMAIN
! =============================================================================

PROGRAM TEMP_L
    IMPLICIT NONE
    ! DECLARATIONS
    INTEGER, PARAMETER :: NX = 8, NY = 8
    REAL, DIMENSION(0:NX, 0:NY) :: T = 0
    INTEGER :: OUTER, I, J
    ! EXECUTIONER
    T(4, 4:NY) = 100
    T(4:NX, 4) = 100
    T(5:NX, 5:NY) = -1

    DO OUTER = 1, 100
        DO I = 1, NX-1
            DO J = 1, NY-1
                IF (I >= 4 .AND. J >= 4) CYCLE
                T(I, J) = 0.25 * &
                    (T(I+1, J) + T(I-1, J) + T(I, J+1) + T(I, J-1))
            END DO
        END DO
    END DO
    DO J = NY, 0, -1
        WRITE(*, '9F9.6') (T(I, J), I=0, NX)
    END DO
END PROGRAM TEMP_L
