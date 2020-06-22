.data

arr: .quad 4, 9, 13, 15, 22, 25, 27
arrlen: .quad 7
output: .string "Expected value is present at index: %i"

.text

.global main

binarySearch:

	cmp %r8, %rdx #comparing here
	jl leftHalf #if value we are looking for is smaller than middle we jump to the left arr 

	jmp rightHalf #else, we jump to the right side of the arr (right half)


leftHalf:

	cmp (%rdi, %r10, 8), %r8 #comparing the value here
	je elemFoundInLeft #if equal, we found it and jmp to return 

	inc %r10 #if not, we continue incrementing the index
	cmp %r8, %r10 #comparing here again
	jl leftHalf #jumping back if less

	mov $-1, %rax #returning -1 if index was not found
	ret 

rightHalf:

	cmp (%rdi, %r11, 8), %r8 #comparing the value here
	je elemFoundInRight #if equal, we found it and jmp to return
 
	inc %r11  #if not, we continue checking and incrementing the index 
	cmp %r8, %r11 #comparing again here
	jl rightHalf #jumping back if less

	mov $-1, %rax #returning -1 if index was not found
	ret 

elemFoundInLeft:

	mov %r10, %rsi #moving the index where the expected value was found 
	ret 

elemFoundInRight: 
	mov %r11, %rsi #moving the inded where the expected value was found 
	ret 

main:
	mov $arr, %rdi
	mov (arrlen), %rsi

	mov $9, %r8
	mov $3, %rdx
	mov $0, %r10 
	mov $4, %r11

	call binarySearch

	mov $output, %rdi
	xor %rax, %rax
	call printf 