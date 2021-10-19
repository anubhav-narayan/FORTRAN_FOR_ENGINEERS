! =============================================================================
! MATRIX MULTIPLIER
! =============================================================================

PROGRAM MATRIX_MULTIPLIER
    IMPLICIT NONE
    ! DECLARATIONS
    INTEGER, PARAMETER :: M_A = 3, N_A = 3 ! DIMENSIONS OF MATRX A
    INTEGER, PARAMETER :: M_B = 3, N_B = 3 ! DIMENSIONS OF MATRX B
    REAL :: A(1:M_A, 1:N_A), B(1:M_B, 1:N_B), &
            C(1:M_A, 1:N_B)
    INTEGER :: I
    ! EXECUTIONER
    WRITE(*, '(A)') "MATRIX A"
    DO I = 1, M_A
        READ(*,  '(F12.3, F12.3, F12.3)') A(I, 1:N_A)
    END DO
    WRITE(*, '(A)') "MATRIX B"
    DO I = 1, M_B
        READ(*,  '(F12.3, F12.3, F12.3)') B(I, 1:N_B)
    END DO
    C = MATMUL(A, B)
    WRITE(*, '(A)') "MATRIX C"
    DO I = 1, M_A
        WRITE(*,  '(3F12.3)') C(I, 1:N_B)
        WRITE(*, *)
    END DO
END PROGRAM MATRIX_MULTIPLIER
