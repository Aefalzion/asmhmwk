.data
negative:
	.long 0
strres:
	.string "00000000000000000000000000000000\n"
	.set res_len, . - strres - 1
.text
.globl main
.type main, @function

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
		subl $48, %eax
		pushl %eax           #eax->stack
		movl $10, %eax       #eax=10
		mull %ebx            #eax=eax*ebx
		movl %eax, %ebx      #ebx=eax
		popl %eax            #stack->eax
		addl %eax, %ebx      #ebx+=eax
		call getchar         #eax<-keybrd
		cmpl $'-', %eax
		jne ok
		cmpl $1, (negative)
		jne okok
		movl $1, %eax
		movl $1, %ebx
		int $0x80
		okok:
		movl $1, (negative)
		call getchar
		ok:
		cmpl $0xa, %eax      #'\n' - exit
	jne jmp
							 #ebx - our number
	cmpl $1, (negative)
		jne positive
		movl %ebx, %eax
		subl %ebx, %ebx
		subl %eax, %ebx
	positive:
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
	
	movl %ebp, %esp
	popl %ebp
	popl %edx
	popl %ecx
	popl %ebx
	movl $0, %eax
	ret

.size main, . - main
