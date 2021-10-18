!     model a coin toss
!     compiled with gfortran heads_or_tails.f90

      IMPLICIT NONE
      INTEGER :: i, ntoss, heads, tails
      REAL :: x

      WRITE(*,'(A)', ADVANCE='NO')'Enter number of coin tosses : '
      READ(*,*)ntoss

      DO i=1,ntoss
      CALL RANDOM_NUMBER(x)
       if(x .gt. 0.5)tails=tails+1
       if(x .lt. 0.5)heads=heads+1
      END DO
      PRINT*,'Number of heads = ',heads, &
          '  % heads = ', REAL(heads)/REAL(heads+tails) * 100.0, '%'
      PRINT*,'Number of tails = ',tails, &
          '  % tails = ', REAL(tails)/REAL(heads+tails) * 100.0, '%'

      END
