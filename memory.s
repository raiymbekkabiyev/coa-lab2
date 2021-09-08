.data

byte1:   .byte 0x10
word1:   .word 0x12345678
string1: .asciiz "I really like Assembly!\n"
array1:  .byte 1, 2, 3, 4
array2:  .word 1, 2, 3, 4

.text

main:   lb $s1, byte1	#load byte into register $s1
	lw $s2, word1	#load a word into register $s2
	la $s3, array1	#load the address of the first element of array1
	la $s4, array2	#load the address of the first element of array2
	
	li $t0, 0x10010200

	sw $s2, ($t0)   #Stores a word to address contained in $t0 from $s1
	lw $s6, ($t0)   #Loads a word from address contained in $t0 to $s5

	sw $s4, 4($t0)  #Stores a word to address contained in $t0+4 from $s1
	lw $s7, 4($t0)	#Loads a word from address contained in $t0+4 to $s5
		

	la $a0, string1
	li $v0, 4       #Prints the content of string1
	syscall

	li $v0, 10      #Exits the program
	syscall
