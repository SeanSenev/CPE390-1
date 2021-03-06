	// In this file you have to write the assembler code to evaluate a polynomial
	// this requires us to  find out the name of the function
	.globl 	_ZNK10Polynomial4evalEd
_ZNK10Polynomial4evalEd:
	movq	8(%rcx), %rdx
	movl	(%rcx), %ecx	;# ecx has the degree of the polynomial
	movsd	(%edx), %xmm0   ;# load the first coefficient into xmm0
.L1:	
	add	$8, %rdx        ;# point to second coefficient
	mulsd	%xmm1, %xmm0    ;# multiply by x
	addsd   (%rdx), %xmm0   ;# add each coefficient
	subl	$1, %ecx        ;# count down to zero
	jg	.L1             ;# keep doing it
	;# xmm0 has the answer
	ret

