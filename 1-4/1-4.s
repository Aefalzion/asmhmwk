.data
str1:
	.string "1"
str0:
	.string "0"
	.set b_l, . - str0 - 1
strres:
	.string "00000000000000000000000000000000\n"
	.set res_len, . - strres - 1
.text
.globl main
.type main, @function
inttochar:
	cmp $10, %eax
	jnl big1
	addl $'0', %eax
	ret
	big1:
	addl $87, %eax
	ret
chartoint:
	cmp $'a', %eax
	jnl big
	subl $'0', %eax
	ret
	big:
	subl $'a', %eax
	addl $10, %eax
	ret
main:
	pushl %ebx
	pushl %ecx
	pushl %edx
	pushl %ebp
	movl %esp, %ebp

	subl %eax, %eax          #eax=0
	subl %ebx, %ebx          #ebx=0
	movl $48, %eax
	jmp:
		call chartoint
		shl $4, %ebx
		addl %eax, %ebx      #ebx+=eax
		call getchar         #eax<-keybrd
		cmpl $0xa, %eax      #'\n' - exit
	jne jmp
							 #ebx - our number
	movl $32, %ecx
	loop_start:	
		movl $0x00000001, %eax
		andl %ebx, %eax
		call inttochar
		mov $strres, %edx
		leal -1(%edx,%ecx,1), %edx
		movb %al, (%edx)
		shr $1, %ebx
	loop loop_start	

	movl $4, %eax
	movl $1, %ebx
	movl $strres, %ecx
	movl $res_len, %edx
	int $0x80
	
	movl %ebp, %esp
	popl %ebp
	popl %edx
	popl %ecx
	popl %ebx
	subl %eax, %eax
	ret
.size main, . - main
