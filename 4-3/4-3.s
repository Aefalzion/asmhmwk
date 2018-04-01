	.file	"a.c"
	.globl	a
	.bss
	.align 4
	.type	a, @object
	.size	a, 4
a:
	.zero	4
	.globl	b
	.align 4
	.type	b, @object
	.size	b, 4
b:
	.zero	4
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	$0, a
	jmp	.L2
.L3:
	movl	b, %edx
	movl	a, %eax
	addl	%edx, %eax
	movl	%eax, b
	movl	a, %eax
	addl	$1, %eax
	movl	%eax, a
.L2:
	movl	a, %eax
	cmpl	$10, %eax
	jle	.L3
	movl	$0, a
	movl	$0, b
	jmp	.L4
.L5:
	movl	b, %edx
	movl	a, %eax
	addl	%edx, %eax
	movl	%eax, b
	movl	a, %eax
	addl	$1, %eax
	movl	%eax, a
.L4:
	movl	a, %eax
	cmpl	$10, %eax
	jle	.L5
	movl	$0, a
	movl	$0, b
.L6:
	movl	b, %edx
	movl	a, %eax
	addl	%edx, %eax
	movl	%eax, b
	movl	a, %eax
	addl	$1, %eax
	movl	%eax, a
	movl	a, %eax
	cmpl	$10, %eax
	jle	.L6
	movl	$0, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
