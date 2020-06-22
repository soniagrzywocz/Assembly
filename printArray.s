.data

arrlen: .quad 5
arr: .quad 3, 8, 2, 6, 1

output: .string "The array consists of: %d\n"

.text

.global main

clean: 
		xor %rax, %rax
		xor %rcx, %rcx

getElement:
		push %rsi
		dec %r9
		mov (%r8, %r9, 8), %rcx
		cmp $0, %r9
		jge printElement
		ret

printElement:
		push %rcx
		mov %rcx, %rsi
		mov $output, %rdi
		xor %rax, %rax
		push %r9
		push %r8
		push %rcx
		call printf 
		pop %rcx
		pop %r8
		pop %r9
		jmp getElement

main:
		mov $arr, %r8
		mov (arrlen), %r9
		jmp getElement