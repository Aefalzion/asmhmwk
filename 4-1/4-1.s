.data
a:
	.long	5
b:
	.long	3
.text
	.globl	main
	.type	main, @function

main:
	pushl	%ebp
	
	movl	%esp, %ebp
	pushl   %eax
	pushl   %ebx
	pushl   %ecx
	pushl   %edx

	
	movl	(a), %edx
	movl	(b), %eax
	cmpl	%eax, %edx  /* if (a > b)  */
	jle	.L2
	movl	(b), %eax     /*else*/
	movl	%eax, (a)
	jmp	.L3             /*конец else*/
.L2:
	movl	(a), %eax     /*основной код if*/
	movl	%eax, (b)	    /*конец основного кода*/
.L3:
	
	
	popl    %edx
	popl    %ecx
	popl    %ebx
	popl    %eax
	movl    %ebp, %esp
	popl	%ebp
	movl	$0, %eax
	ret
