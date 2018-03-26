.data

.a:
	.long 100
.b:
	.long 10
.text
.globl main
.type main, @function
.main:
	pushl %eax
	pushl %ebx
	pushl %ecx
	pushl %edx
	
	
	
	popl %edx
	popl %ecx
	popl %ebx
	popl %eax
	movl $0, %eax
	ret
