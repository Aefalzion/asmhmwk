	.data
n:
	.int 	0
	.text
	.globl	f
	.type	f, @function
f:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$n, %eax /* в %eax возвращается указатель на n */
	popl	%ebp
	ret
	
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$0, %eax
	popl	%ebp
	ret
