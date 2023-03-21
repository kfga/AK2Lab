SYSEXIT = 1
EXIT_SUCCESS = 0
SYSWRITE = 4
STDOUT = 1
SYSREAD = 3
STDIN = 0

.data
buf: .ascii "     "
buf_len = . - buf
buf2: .ascii "     "
buf2_len = . - buf2

.text
msg: .ascii "Write first text (5): \n"
msg_len = . - msg
msg2: .ascii "Write second text (5): \n "
msg2_len = . - msg2
msg3: .ascii "Text not equal \n"
msg3_len = . - msg3

.global _start
_start:

mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $msg, %ecx
mov $msg_len, %edx
int $0x80

mov $SYSREAD, %eax
mov $STDIN, %ebx
mov $buf, %ecx
mov $buf_len, %edx
int $0x80

mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $msg2, %ecx
mov $msg2_len, %edx
int $0x80

mov $SYSREAD, %eax
mov $STDIN, %ebx
mov $buf2, %ecx
mov $buf2_len, %edx
int $0x80

mov (%ebx), $al
cmp (%ecx), $al
JNE not_equal

mov 1(%ebx), %al
cmp 1(%ecx), %al
JNE not_equal

mov 2(%ebx), %al
cmp 2(%ecx), %al
JNE not_equal

mov 3(%ebx), %al
cmp 3(%ecx), %al
JNE not_equal

mov 4(%ebx), %al
cmp 4(%ecx), %al
JNE not_equal

not_equal:
mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $msg3, %ecx
mov $msg3_len, %edx
int $0x80

mov $SYSEXIT, %eax
mov $EXIT_SUCCESS, %ebx
int $0x80
