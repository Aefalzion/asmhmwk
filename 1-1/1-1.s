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

main:
	subl %eax, %eax          #eax=0
	subl %ebx, %ebx          #ebx=0
	movl $48, %eax
	jmp:
		subl $48, %eax
		pushl %eax           #eax->stack
		movl $10, %eax       #eax=10
		mull %ebx            #eax=eax*ebx
		movl %eax, %ebx      #ebx=eax
		popl %eax            #stack->eax
		addl %eax, %ebx      #ebx+=eax
		call getchar         #eax<-keybrd
		cmpl $0xa, %eax      #'\n' - exit
	jne jmp
							 #ebx - our number
	movl $32, %ecx
	loop_start:	
		testl $0b00000000000000000000000000000001, %ebx
		je skip
			mov $strres, %eax
			leal -1(%eax,%ecx,1), %eax
			movb $49, (%eax)
		skip:
		shr $1, %ebx
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
