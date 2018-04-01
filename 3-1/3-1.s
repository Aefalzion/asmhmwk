.data
a:
	.long 100
b:
	.long 10
str:
	.string "%d\n"
.text
.globl main
.type main, @function
main:
	  /*программа считает (100/10+10)*10-10 */
	pushl %ebx
	pushl %ecx
	pushl %edx
	pushl %ebp
	movl %esp, %ebp
	movl (a), %eax
	movl (b), %ebx
	xorl %edx, %edx
	divl %ebx
	addl %ebx, %eax
	mull %ebx
	subl %ebx, %eax
	movl %eax, (a)
	pushl (a)
	pushl $str
	call printf
	add $8, %esp
	movl %ebp, %esp
	popl %ebp
	popl %edx
	popl %ecx
	popl %ebx
	movl $0, %eax
	ret
