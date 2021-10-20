! =============================================================================
! PROJECTILE
! =============================================================================

! MILES/HOUR TO KILOMETRE/HOUR
SUBROUTINE MPH_TO_KMPH (VAL, KMPH)
IMPLICIT NONE
REAL, INTENT(OUT) :: KMPH
REAL, INTENT(IN) :: VAL
    KMPH = VAL * 1.609344
    RETURN
END SUBROUTINE MPH_TO_KMPH

! MILES/HOUR TO METRE/SEC
SUBROUTINE MPH_TO_MS (VAL, MS)
IMPLICIT NONE
REAL, INTENT(OUT) :: MS
REAL, INTENT(IN) :: VAL
    CALL MPH_TO_KMPH(VAL, MS)
    MS = MS * 1000.0 / 3600.0
    RETURN
END SUBROUTINE MPH_TO_MS

! SPEED TO VECTOR SPPED WITH ANGLE IN DEGREES
SUBROUTINE SPEED_VECTOR (SPEED, ANGLE, VECTOR)
REAL, DIMENSION(2), INTENT(OUT) :: VECTOR
REAL, INTENT(IN) :: SPEED, ANGLE
    VECTOR(1) = SPEED * COSD(ANGLE)
    VECTOR(2) = SPEED * SIND(ANGLE)
    RETURN
END SUBROUTINE SPEED_VECTOR


PROGRAM PROJECTILE
    IMPLICIT NONE
!   DECLERATIONS
    REAL, PARAMETER :: G = 9.81
    REAL :: SPD, T
    REAL, DIMENSION(2) :: SPD_VEC, DISTANCE
!   EXECUTIONER
    T = 0.0
    CALL MPH_TO_MS(100.0, SPD)
    CALL SPEED_VECTOR(SPD, 12., SPD_VEC)
    DISTANCE(1) = SPD_VEC(1) * T
    DISTANCE(2) = SPD_VEC(2) * T - 0.5 * G * T ** 2
    DO
        PRINT '(2F10.4, F6.2)', DISTANCE, T
        T = T + 0.01
        DISTANCE(1) = SPD_VEC(1) * T
        DISTANCE(2) = SPD_VEC(2) * T - 0.5 * G * T ** 2
        IF (DISTANCE(2) <= 0) EXIT
    END DO
END PROGRAM PROJECTILE
