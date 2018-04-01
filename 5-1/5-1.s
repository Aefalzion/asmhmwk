	.data
array:
	.long	14, 15, 22, 9, 31, 15, 0
string:
	.string "%li\n"
	.text
	.globl main
	.type main, @function
main:
	pushl %ebp
	pushl %ebx
	pushl %ecx
	pushl %edx
	movl %esp, %ebp

	movl (array), %ebx		/* %ebx - минимальный элемент */
	movl $array, %eax		/* %eax - указатель на текущий элемент */
	
again:
	movl (%eax), %ecx
	cmpl $0, %ecx
	je exit
	cmpl %ecx, %ebx
	jle notbigger

	movl %ecx, %ebx

notbigger:
	addl $4, %eax
exit:
	
	pushl %ebx
	pushl $string
	call printf

	movl $0, %eax
	movl %ebp, %esp
	popl %edx
	popl %ecx
	popl %ebx
	popl %ebp




