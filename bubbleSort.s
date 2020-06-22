.data

arr: .quad 13, 9, 23, 15, 27
arrlen: .quad 4
output: .string "%i"
newline: .string "\n"

.text

.global main

bubbleSort:
	call sort  
   
	inc %r13
	cmp %rsi, %r13 
	jge bubbleSort
	jmp printArr

sort:
    xor %r8, %r8
    xor %r10, %r10
	mov (%rdi, %r9, 8), %r8
	inc %r9
	mov (%rdi, %r9, 8), %r10
	cmp %r8, %r10
	jl swap


  
	cmp %rsi, %r9
	jle sort    
	
	ret 

swap:
	push %r8
	push %r10
	pop %r8
	pop %r10

	dec %r9
	mov %r8, (%rdi, %r9, 8)
	inc %r9
	mov %r10, (%rdi, %r9, 8)
	xor %r8, %r8
	xor %r10, %r10
	jmp sort 

printArr:
	xor %rax, %rax

_printArr:
	push %rdi
	push %rsi
	push %rax

	mov (%rdi, %rax, 8), %rsi
	mov $output, %rdi
	xor %rax, %rax
	call printf

	pop %rax
	pop %rsi
	pop %rdi 

	inc %rax
	cmp %rsi, %rax
	jl _printArr

	mov $newline, %rdi
	mov %rax, %rax
	call printf 

	ret 
	
main:
	mov $arr, %rdi
	mov (arrlen), %rsi 
	mov $0, %r9
	mov $0, %r13
	call bubbleSort
