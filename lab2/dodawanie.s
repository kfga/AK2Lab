SYSEXIT = 1
EXIT_SUCCESS = 0

.code32
.data
liczba1:
	.long 0x10304008, 0x701100FF, 0x45100020, 0x08570030
liczba2:
	.long 0xF040500C, 0x00220026, 0x321000CB, 0x04520031
.text
.global _start

_start:
movl $4, %ecx
clc

petla:
	decl %ecx
	movl liczba1(,%ecx,4), %eax
	movl liczba2(,%ecx,4), %ebx
	adcl %eax, %ebx
	pushl %ebx
	loop petla

jnc koniec
push $1

koniec:
mov $SYSEXIT, %eax
mov $EXIT_SUCCESS, %ebx
int $0x80
