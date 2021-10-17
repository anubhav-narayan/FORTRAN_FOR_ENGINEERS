! =============================================================================
! OK TO PAINT
! =============================================================================

PROGRAM PAINT_CHECK
    IMPLICIT NONE
    ! DECLARATION
    REAL :: RHUM ! RELATIVE HUMIDITY
    REAL :: WSPD ! WIND SPEED
    REAL :: TEMP ! TEMPERATURE
    LOGICAL :: OK_TO_PAINT = .FALSE.
    ! EXECUTIONER
    WRITE(*, '(A)', ADVANCE='NO') "RELATIVE HUMIDITY : "
    READ(*, *) RHUM
    WRITE(*, '(A)', ADVANCE='NO') "WIND SPEED : "
    READ(*, *) WSPD
    WRITE(*, '(A)', ADVANCE='NO') "TEMPERATURE : "
    READ(*, *) TEMP
    IF (RHUM > 85.0) THEN
        OK_TO_PAINT = .FALSE.
    ELSE IF (WSPD >= 3.0) THEN
        OK_TO_PAINT = .FALSE.
    ELSE IF (TEMP < 10.0 .OR. TEMP > 30.0) THEN
        OK_TO_PAINT = .FALSE.
    ELSE
        OK_TO_PAINT = .TRUE.
    END IF
    PRINT *, "OK TO PAINT : ", OK_TO_PAINT
END PROGRAM PAINT_CHECK
