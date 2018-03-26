.data
char1:
.byte '0'
.p2align 2
char2:
.byte '0'  /*объявление 1-байтовой переменной*/
.p2align 2
short1:
.short     /*2-байтовая переменная*/
.p2align 2	
long1:
.long      /*4-байтовая переменная*/
newline:
.string "\n"  /*объявление строки*/
.text
.globl main
.type main, @function



main:
	call getchar	
	movl %eax, %ebx
	call getchar
	xchgl %eax, %ebx
	movb %al, (char1)
	movb %bl, (char2)
	movl $4, %eax
	movl $1, %ebx
	movl $char1, %ecx
	movl $1, %edx
	int $0x80
	movl $4, %eax
	movl $1, %ebx
	movl $1, %edx
	movl $char2, %ecx
	int $0x80

	movl $1, %eax
	movl $0, %ebx
	int $0x80
.size main, . - main
