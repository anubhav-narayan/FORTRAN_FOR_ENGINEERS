! =============================================================================
! RANDOM DATA GENERATOR
! =============================================================================

PROGRAM RANDOM_DATA_GEN
    IMPLICIT NONE
!   DECLARATIONS
    REAL :: T, K
    INTEGER :: UNIT, I, STAT
    CHARACTER :: DAT = "./DATA.DAT"
!   EXECUTIONER
    OPEN(UNIT=UNIT, FILE=DAT, IOSTAT=STAT, STATUS="REPLACE")
    CALL RANDOM_SEED()
    DO I = 1, 100
        CALL RANDOM_NUMBER(T)
        CALL RANDOM_NUMBER(K)
        WRITE(UNIT, '(2F10.4)') T, K
    END DO
    CLOSE(UNIT)
END PROGRAM RANDOM_DATA_GEN
