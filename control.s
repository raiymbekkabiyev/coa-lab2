.data

array1: .word 1, 2, 3, 4

.text

main:	ori	$s0, $0,  0	#initialize $s0 to 0
	ori 	$s1, $0,  5	#initialize $s1 to 5
	beq 	$s0, $s1, else
	addi 	$s1, $s1, 1    	# if ($s0!=$s1) $s1 = 5 + 1 = 6
	
else:	addi 	$s1, $s1, 2    	# else          $s1 = 6 + 2 = 8

	la 	$s0, array1  	#load the address of array1 to $s0
	add 	$s1, $s0, 16  	#load the end of array1 to $s1

loop:	lw 	$s2, 0($s0)    	#load the ith element of array1 to $2
	addi 	$s2, $s2, 48 	#add 48 why??
	sw 	$s2, 0($s0)    	#store the new value to the same address
	addi 	$s0, $s0, 4    	#add 4 to $s0 so it points to the next array1 element
	bne 	$s0, $s1, loop 	#loop until all 4 elements have been processed

	la 	$s0, array1    	#reload the address of array1 to $s0

print:  li	$v0, 4 
	move 	$a0, $s0       	#copy the contents of $s0 to $a0
	syscall
	addi 	$s0, $s0, 4    	#point to the next element of array1
	bne 	$s0, $s1, print	#loop until all 4 elements are print out
	
	
	li 	$v0, 10        	#exit program
	syscall	
