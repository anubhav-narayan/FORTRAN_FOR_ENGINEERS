! =============================================================================
! TRIDIAGONAL MATRIX SOLVER
! =============================================================================

SUBROUTINE FORWARD_ELIMINATION(N, A, B, C, D)
IMPLICIT NONE
REAL, INTENT(INOUT) :: B(1:N), D(1:N)
REAL, INTENT(INOUT) :: A(2:N), C(1:N-1)
INTEGER, INTENT(IN) :: N
	REAL :: M
	INTEGER :: K
	DO K = 2, N
		M = A(K) / B(K-1)
		B(K) = B(K) - M * C(K-1)
		D(K) = D(K) - M * D(K-1)
	END DO
	RETURN
END SUBROUTINE FORWARD_ELIMINATION

SUBROUTINE BACK_SUBSTITUTION(N, A, B, C, D, X)
IMPLICIT NONE
REAL, INTENT(OUT) :: X(1:N)
REAL, INTENT(IN) :: B(1:N), D(1:N)
REAL, INTENT(IN) :: A(2:N), C(1:N-1)
INTEGER, INTENT(IN) :: N
	INTEGER :: K
	X(N) = D(N) / B(N)
	DO K = N-1, 1, -1
		X(K) = (D(K) - C(K) * X(K+1)) / B(K)
	END DO
	RETURN
END SUBROUTINE BACK_SUBSTITUTION

SUBROUTINE TRIDIAGONAL_SOLVER(N, A, B, C, D, X)
IMPLICIT NONE
REAL, INTENT(OUT) :: X(1:N)
REAL, INTENT(INOUT) :: B(1:N), D(1:N)
REAL, INTENT(INOUT) :: A(2:N), C(1:N-1)
INTEGER, INTENT(IN) :: N
	CALL FORWARD_ELIMINATION(N, A, B, C, D)
	CALL BACK_SUBSTITUTION(N, A, B, C, D, X)
	RETURN
END SUBROUTINE TRIDIAGONAL_SOLVER


PROGRAM SOLVER
	IMPLICIT NONE
	INTEGER :: I
	REAL :: A(2:5), B(1:5), C(1:4), D(1:5), X(1:5)
	A(2) = 1.; A(3) = 2.; A(4) = 1.; A(5) = 2.;
	B(1) = 5.; B(2) = 3.; B(3) = 4.; B(4) = 6.; B(5) = 5.;
	C(1) = 2.; C(2) = 1.; C(3) = 2.; C(4) = 3.;
	D(1) = 1.; D(2) = 2.; D(3) = 3.; D(4) = 4.; D(5) = 5.;
	CALL TRIDIAGONAL_SOLVER(5, A, B, C, D, X)
	DO I = 1, 5
		WRITE(*, '(AI1AES12.6E1)') "X", I, " = ", X(I)
	END DO
END PROGRAM SOLVER
