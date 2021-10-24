! =============================================================================
! HOMOGENOUS SINGLY LINKED LIST MODULE
! AUTHOR : ANUBHAV MATTOO
! DATE : 2021-10-24
! =============================================================================

MODULE LINKED_LIST
IMPLICIT NONE
PRIVATE
PUBLIC :: INTEGER_LIST_T, VISITOR_T

	TYPE :: INTEGER_LIST_NODE_T
		PRIVATE
		INTEGER :: VAL
		TYPE(INTEGER_LIST_NODE_T), POINTER :: NEXT => NULL()
	END TYPE

	TYPE :: INTEGER_LIST_T
		PRIVATE
		TYPE(INTEGER_LIST_NODE_T), POINTER :: HEAD => NULL()
		TYPE(INTEGER_LIST_NODE_T), POINTER :: TAIL => NULL()
	CONTAINS
		PRIVATE
		PROCEDURE, PUBLIC :: PREPEND
		PROCEDURE, PUBLIC :: FOREACH
	END TYPE

	TYPE, ABSTRACT :: VISITOR_T
	CONTAINS
		PRIVATE
		PROCEDURE(VISIT_I), DEFERRED, PUBLIC :: VISIT
	END TYPE

	ABSTRACT INTERFACE
		SUBROUTINE VISIT_I(SELF, ITEM)
		IMPORT VISITOR_T
		IMPLICIT NONE
		CLASS(VISITOR_T), INTENT(INOUT) :: SELF
		INTEGER, INTENT(INOUT) :: ITEM
		END SUBROUTINE VISIT_I
	END INTERFACE

CONTAINS
	
	SUBROUTINE PREPEND(SELF, ITEM)
	CLASS(INTEGER_LIST_T), INTENT(INOUT) :: SELF
	INTEGER, INTENT(IN) :: ITEM
		TYPE(INTEGER_LIST_NODE_T), POINTER :: NEW
		IF (ASSOCIATED(SELF%HEAD)) THEN
			ALLOCATE(NEW)
			NEW%VAL = ITEM
			NEW%NEXT => SELF%HEAD
			SELF%HEAD => NEW
		ELSE
			ALLOCATE(SELF%HEAD)
			SELF%HEAD%VAL = ITEM
		END IF
	END SUBROUTINE PREPEND

	SUBROUTINE FOREACH(SELF, VISITOR)
	CLASS(INTEGER_LIST_T), INTENT(INOUT) :: SELF
	CLASS(VISITOR_T), INTENT(INOUT) :: VISITOR
		TYPE(INTEGER_LIST_NODE_T), POINTER :: CURSOR
		CURSOR => SELF%HEAD
		DO WHILE (ASSOCIATED(CURSOR))
			CALL VISITOR%VISIT(CURSOR%VAL)
			CURSOR => CURSOR%NEXT
		END DO
	END SUBROUTINE FOREACH

END MODULE LINKED_LIST

MODULE LINKED_LIST_OPS
USE LINKED_LIST, ONLY: VISITOR_T
IMPLICIT NONE
PRIVATE
PUBLIC :: PRINTER_T, SUMMATION_T
	TYPE, EXTENDS(VISITOR_T) :: PRINTER_T
	CONTAINS
		PRIVATE
		PROCEDURE, PUBLIC :: VISIT => PRINT_ITEM
	END TYPE

	TYPE, EXTENDS(VISITOR_T) :: SUMMATION_T
		INTEGER :: SUM = 0
	CONTAINS
		PRIVATE
		PROCEDURE, PUBLIC :: VISIT => SUM_ITEM
		PROCEDURE, PUBLIC :: GET_SUM
	END TYPE

CONTAINS

	SUBROUTINE PRINT_ITEM(SELF, ITEM)
	CLASS(PRINTER_T), INTENT(INOUT) :: SELF
	INTEGER, INTENT(INOUT) :: ITEM
		WRITE(*, *) ITEM
	END SUBROUTINE PRINT_ITEM

	SUBROUTINE SUM_ITEM(SELF, ITEM)
	CLASS(SUMMATION_T), INTENT(INOUT) :: SELF
	INTEGER, INTENT(INOUT) :: ITEM
		SELF%SUM = SELF%SUM + ITEM
	END SUBROUTINE SUM_ITEM

	FUNCTION GET_SUM(SELF)
	CLASS(SUMMATION_T), INTENT(IN) :: SELF
	INTEGER :: GET_SUM
		GET_SUM = SELF%SUM
	END FUNCTION GET_SUM

END MODULE LINKED_LIST_OPS

PROGRAM MAIN
    USE LINKED_LIST, ONLY: INTEGER_LIST_T
    USE LINKED_LIST_OPS, ONLY: PRINTER_T, SUMMATION_T

    IMPLICIT NONE

    TYPE(INTEGER_LIST_T) :: LIST
    TYPE(PRINTER_T) :: PRINTER
    TYPE(SUMMATION_T) :: SUM

    CALL LIST%PREPEND(2)
    CALL LIST%PREPEND(3)
    CALL LIST%PREPEND(5)

    CALL LIST%FOREACH(PRINTER)

    CALL LIST%FOREACH(SUM)

    PRINT *, SUM%GET_SUM()
END PROGRAM