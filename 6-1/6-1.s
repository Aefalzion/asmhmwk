	.text
	.globl	main
	.type	main, @function
main:
	pushl 	%ebp
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	movl	%esp, %ebp
	
	movb	$97, -29(%esp)	/* char a = 'a' */
	movl	$1, -28(%esp)	/* int b = 1 */
	movl	$2, -24(%esp)  	/* long int c = 2 */
	fld1					/* загружает 1.0 в стек сопроцессора */ 
	fstps	-20(%esp)		/* сохраняет 1.0 из вершины стека сопроцессора в память и выталкивает его; суффикс s - short для float */
	fld1					/* загружает 1.0 в стек сопроцессора */ 
	fstpl	-16(%esp)		/* l - long для double */
	movl	$0, %eax		/* return 0 */
	
	movl	%ebp, %esp
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%ebp
	ret
