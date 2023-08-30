#include "go_asm.h"
#include "funcdata.h"
#include "textflag.h"

TEXT preempt·A(SB),NOSPLIT,$0
	MOVD	$1000000, R1
	PCALIGN	$16
loop:
	SUB	$1, R1, R1
	CBNZ	R1, loop

	RET

TEXT preempt·B(SB),NOSPLIT,$0
	MOVD	$1000000, R1
	// use g.panic field temporarily
	MOVD	g, 32(g) // any non-nil pointer would work to write here
	PCALIGN	$16
loop:
	MOVD	32(g), R2
	MOVD	(R2), R2
	SUB	$1, R1, R1
	CBNZ	R1, loop

	MOVD	ZR, 32(g)
	RET

TEXT preempt·C(SB),NOSPLIT,$0
	MOVD	$1000000, R1
	// use g.panic field temporarily
	ADD	$32, g, R2
	MOVD	R2, (R2)
	PCALIGN	$16
loop:
	MOVD	(R2), R2
	SUB	$1, R1, R1
	CBNZ	R1, loop

	MOVD	ZR, 32(g)
	RET

TEXT preempt·D(SB),NOSPLIT,$0
	MOVD	$4000000, R1
	PCALIGN	$16
loop:
	SUB	$1, R1, R1
	SUB	$1, R1, R1
	SUB	$1, R1, R1
	SUB	$1, R1, R1
	CBNZ	R1, loop

	RET

TEXT preempt·E(SB),NOSPLIT,$0
	MOVD	$4000000, R1
	// use g.panic field temporarily
	MOVD	g, 32(g) // any non-nil pointer would work to write here
	PCALIGN	$16
loop:
	MOVD	32(g), R2
	MOVD	(R2), R2
	SUB	$1, R1, R1
	SUB	$1, R1, R1
	SUB	$1, R1, R1
	SUB	$1, R1, R1
	CBNZ	R1, loop

	MOVD	ZR, 32(g)
	RET

TEXT preempt·F(SB),NOSPLIT,$0
	MOVD	$4000000, R1
	// use g.panic field temporarily
	ADD	$32, g, R2
	MOVD	R2, (R2)
	PCALIGN	$16
loop:
	MOVD	(R2), R2
	SUB	$1, R1, R1
	SUB	$1, R1, R1
	SUB	$1, R1, R1
	SUB	$1, R1, R1
	CBNZ	R1, loop

	MOVD	ZR, 32(g)
	RET
