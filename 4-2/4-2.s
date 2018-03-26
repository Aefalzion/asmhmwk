	.data
a:
	.long	1
b:
	.long	0
	.text
	.globl	main
	.type	main, @function
main:
	pushl	%edx
	pushl	%ecx
	pushl 	%ebx
	pushl	%ebp
	movl	%esp, %ebp
	movl	a, %eax	
	testl	%eax, %eax	/* начало switch (a) */	
	je	.L3
	cmpl	$1, %eax
	je	.L4
	jmp	.L7
.L3:					/* case 0: */
	movl	$0, b
	jmp	.L5				/* break;  */
.L4:					/* case 1: */
	movl	$1, b
	jmp	.L5				/* break;  */
.L7:					/* default:*/
	movl	$2, b
.L5:					/* конец switch */
	movl	$0, %eax
	movl	%ebp, %esp
	popl	%ebp
	popl	%ebx
	popl	%ecx
	popl	%edx
	
	ret
