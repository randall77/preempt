#include "go_asm.h"
#include "funcdata.h"
#include "textflag.h"

TEXT preempt·A(SB),NOSPLIT,$0
	MOVQ	$1000000, AX
	PCALIGN	$16
loop:
	SUBQ	$1, AX
	JNE	loop

	RET

TEXT preempt·B(SB),NOSPLIT,$0
	MOVQ	$1000000, AX
	// use g.panic field temporarily
	MOVQ	g, 32(g) // any non-faulting pointer would work to write here
	PCALIGN	$16
loop:
	MOVQ	32(g), CX
	MOVQ	(CX), CX
	SUBQ	$1, AX
	JNE	loop

	MOVQ	$0, 32(g)
	RET

TEXT preempt·C(SB),NOSPLIT,$0
	MOVQ	$1000000, AX
	// use g.panic field temporarily
	LEAQ	32(g), CX
	MOVQ	CX, (CX)
	PCALIGN	$16
loop:
	MOVQ	(CX), CX
	SUBQ	$1, AX
	JNE	loop

	MOVQ	$0, 32(g)
	RET

TEXT preempt·D(SB),NOSPLIT,$0
	MOVQ	$4000000, AX
	PCALIGN	$16
loop:
	SUBQ	$1, AX
	SUBQ	$1, AX
	SUBQ	$1, AX
	SUBQ	$1, AX
	JNE	loop

	RET

TEXT preempt·E(SB),NOSPLIT,$0
	MOVQ	$4000000, AX
	// use g.panic field temporarily
	MOVQ	g, 32(g)
	PCALIGN	$16
loop:
	MOVQ	32(g), CX
	MOVQ	(CX), CX
	SUBQ	$1, AX
	SUBQ	$1, AX
	SUBQ	$1, AX
	SUBQ	$1, AX
	JNE	loop

	MOVQ	$0, 32(g)
	RET

TEXT preempt·F(SB),NOSPLIT,$0
	MOVQ	$4000000, AX
	// use g.panic field temporarily
	LEAQ	32(g), CX
	MOVQ	CX, (CX)
	PCALIGN	$16
loop:
	MOVQ	(CX), CX
	SUBQ	$1, AX
	SUBQ	$1, AX
	SUBQ	$1, AX
	SUBQ	$1, AX
	JNE	loop

	MOVQ	$0, 32(g)
	RET
