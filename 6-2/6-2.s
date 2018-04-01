	.file	"a.c"
	.comm	res,4,4
	.comm	i,4,4
	.comm	i1,4,4
	.comm	array,40,32
	.text
	.globl	sum
	.type	sum, @function
sum:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$0, res
	movl	$0, i
	jmp	.L2
.L3:
	movl	i, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax			/* 8(%ebp) - первый аргумент функции */
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	res, %eax
	addl	%edx, %eax
	movl	%eax, res
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
.L2:
	movl	i, %eax
	cmpl	12(%ebp), %eax			/* 12(%ebp) - второй аргумент */
	jl	.L3
	movl	res, %eax				/* возвращаемое значение записывается в %eax */
	popl	%ebp
	ret
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$0, i
	jmp	.L6
.L7:
	movl	i, %eax
	movl	i, %edx
	movl	%edx, array(,%eax,4)
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
.L6:
	movl	i, %eax
	cmpl	$9, %eax
	jle	.L7
	pushl	$10					/* сначала в стек записывается второй аргумент */
	pushl	$array				/* потом - первый */
	call	sum					/* вызов функции */
	addl	$8, %esp			
	movl	$0, %eax
	leave
	ret
