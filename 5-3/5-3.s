	.comm	person,12,4  		/*объявление переменной person размера 12 байт (три поля по 4 байта) с выравниванием в 4 байта*/
	.data
name:
	.string	"Petya"
family:
	.string	"Petrov"
	.text
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$name, person		/*изменение первого поля*/
	movl	$family, person+4	/*изменение второго поля*/
	movl	$20, person+8		/*изменение третьего поля*/
	movl	$0, %eax
	popl	%ebp
	ret
