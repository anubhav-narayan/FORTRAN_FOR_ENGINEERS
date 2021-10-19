! =============================================================================
! DATA READER (FORMATTED)
! =============================================================================

PROGRAM DATA_READER
    IMPLICIT NONE
!   DECLARATION
    REAL :: T, K
    INTEGER :: UNIT, I, STAT, FSTAT
    CHARACTER(LEN=10) :: DAT
!   EXECUTIONER
    WRITE(*, '(A)', ADVANCE='NO') "FILENAME : "
    READ(*, *) DAT
    OPEN(UNIT=UNIT, FILE=DAT, IOSTAT=STAT, STATUS="OLD")
    IF (STAT < 0) THEN
        WRITE(*, '(A, I10)') "FILE ERROR : ", STAT
    ELSE
        DO
            READ(UNIT, '(F10.4)', IOSTAT=FSTAT) T
            READ(UNIT, '(F10.4)', IOSTAT=FSTAT) K
            IF (FSTAT /= 0) EXIT
            WRITE(*, '(2F10.4)') T, K
        END DO
    END IF
END PROGRAM DATA_READER
