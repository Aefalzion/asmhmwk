	.file	"a.c"
	.data
ar:
	.long	11
	.long	5
	.long	7
	.long	23
	.long	4
	.long	8
	.long	12
	.long	13
	.long	12
	.globl	i
i:
	.long	0
j:
	.long 	0
lo:
	.long	100000
	.section	.rodata
.LC0:
	.string	"%li\n"
	.text
	.globl	main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$4, %esp
	movl	$0, i
	jmp	.L2
.L6:
	movl	$0, j
	jmp	.L3
.L5:
	movl	i, %edx
	movl	j, %ecx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax			/* умножение i на горизонтальный размер массива (3) осуществляется только через сложения за o(log n) операций*/
	addl	%ecx, %eax  		/* %eax = 3 * i + j */
	movl	ar(,%eax,4), %edx	/* обращение к ячейке памяти ar + %eax * 4 */
	movl	lo, %eax
	cmpl	%eax, %edx
	jge	.L4
	movl	i, %edx
	movl	j, %ecx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%ecx, %eax
	movl	ar(,%eax,4), %eax
	movl	%eax, lo
.L4:
	movl	j, %eax
	addl	$1, %eax
	movl	%eax, j
.L3:
	movl	j, %eax
	cmpl	$2, %eax
	jle	.L5
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
.L2:
	movl	i, %eax
	cmpl	$2, %eax
	jle	.L6
	movl	lo, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	movl	$0, %eax
	movl	-4(%ebp), %ecx
	leave
	leal	-4(%ecx), %esp
	ret
