.data
str1:
	.string "1"
str0:
	.string "0"
	.set b_l, . - str0 - 1
strres:
	.string "0x00000000\n"
	.set res_len, . - strres - 1
.text
.globl main
.type main, @function
inttochar:
	cmp $10, %eax
	jnl big
	addl $'0', %eax
	jmp notbig
	big:
	addl $87, %eax
	notbig:
	ret
main:
	subl %eax, %eax          #eax=0
	subl %ebx, %ebx          #ebx=0
	movl $48, %eax
	jmp:
		subl $48, %eax
		shl $1, %ebx
		addl %eax, %ebx      #ebx+=eax
		call getchar         #eax<-keybrd
		cmpl $0xa, %eax      #'\n' - exit
	jne jmp
							 #ebx - our number
	movl $8, %ecx
	loop_start:	
		movl $0x00000f, %eax
		andl %ebx, %eax
		call inttochar
		mov $strres, %edx
		leal 1(%edx,%ecx,1), %edx
		movb %al, (%edx)
		shr $4, %ebx
	loop loop_start	

	movl $4, %eax
	movl $1, %ebx
	movl $strres, %ecx
	movl $res_len, %edx
	int $0x80
	
	

	movl $1, %eax
	movl $0, %ebx
	int $0x80
.size main, . - main
