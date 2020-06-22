.data

output: .string "The prime factorization of number 10 is: %d\n"

.text

.global main


checkPrime:
			# making a division here
			inc %r8
			div %r8 
			cmp $0, %rdx
			je primeFactors
			ret

primeFactors:
			push %rax
			mov %rax, %rsi
			mov $output, %rdi
			xor %rax, %rax
			push %r8
			push %rdx
			call printf 
			pop %rdx
			pop %r8
			pop %rax
			jmp printPrimeDiv

printPrimeDiv:
			push %r8
			mov %r8, %rsi
			mov $output, %rdi
			xor %rax, %rax
			call printf
			pop %r8
			jmp checkPrime
			ret

main:	
			mov $10, %rax
			mov $1, %r8
			xor %rdx, %rdx
			jmp checkPrime 