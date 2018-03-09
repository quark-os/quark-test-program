.section .bss
.align 16
stack_bottom:
.skip 65536 # 16 KiB
stack_top:

.section .text
.global _start
.type _start, @function
_start:

	call kernel_main

	cli
1:	hlt
	jmp 1b

.size _start, . - _start
