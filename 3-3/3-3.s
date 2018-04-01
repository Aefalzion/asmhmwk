.data
inpstr:
.string "%li%li%li%li"
cf:
.long 0
zf:
.long 0
sf: 
.long 0
of:
.long 0
cfi:
.long 0x00000001
zfi:
.long 0x00000040
sfi:
.long 0x00000080
ofi:
.long 0x00000800
eflags:
.long 0
.text
.globl main
.type main, @function
main:
	pushl 	%ebx
	pushl 	%ecx
	pushl	%edx
	pushl	%ebp
	movl 	%esp, %ebp
	
	pushl	$of
	pushl	$sf
	pushl	$zf
	pushl	$cf
	pushl	$inpstr
	call 	scanf
	movl	%ebp, %esp
	
	pushf
	popl	%ecx
	
	movl	(cfi), %ebx
	movl	(cf), %eax
	cmpl	$0, %eax
	jne 	cf1
	notl	%ebx
	andl	%ebx, %ecx
	jmp 	cfend
	cf1:
	orl		%ebx, %ecx
	cfend:
	
	movl	(zfi), %ebx
	movl	(zf), %eax
	cmpl	$0, %eax
	jne 	zf1
	notl	%ebx
	andl	%ebx, %ecx
	jmp 	zfend
	zf1:
	orl		%ebx, %ecx
	zfend:

	movl	(sfi), %ebx
	movl	(sf), %eax
	cmpl	$0, %eax
	jne 	sf1
	notl	%ebx
	andl	%ebx, %ecx
	jmp 	sfend
	sf1:
	orl		%ebx, %ecx
	sfend:
	
	movl	(ofi), %ebx
	movl	(of), %eax
	cmpl	$0, %eax
	jne 	of1
	notl	%ebx
	andl	%ebx, %ecx
	jmp 	ofend
	of1:
	orl		%ebx, %ecx
	ofend:

	pushl 	%ecx
	popf

	movl 	%ebp, %esp
	popl	%ebp
	popl	%edx
	popl	%ecx
	popl	%ebx
	xorl	%eax, %eax
	ret
