! ============================================================================
! PROGRAM TO FIND PENDULUM PERIOD
! ============================================================================
    
PROGRAM PENDULUM_PERIOD
    IMPLICIT NONE
    ! DECLARAIONS
    REAL :: L
    REAL :: G
    REAL :: OSC
    REAL, PARAMETER :: PI = 4.0 * ATAN(1.0)
    ! EXECUTIONER
    WRITE(*, '(A)', ADVANCE='NO') "FREQUENCY : "
    READ(*, *) OSC
    WRITE(*, '(A)', ADVANCE='NO') "ACCELERATION OF GRAVITY : "
    READ(*, *) G
    L = ((0.5 * OSC / PI) ** 2) * G
    WRITE(*, *) "LENGTH OF PENDULUM : ", L, "m"
END PROGRAM PENDULUM_PERIOD
