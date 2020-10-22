.data
msg1: .asciiz "Enter n : "
msg2: .asciiz "\nThe sum of all natural numbers upto n is : "
input: .word 0
answer: .word 0
.text 
li $v0,4
la $a0, msg1 #outputting the msg "Enter n : "
syscall

li $v0,5 #taking input
syscall

lw $a0,input
jal rec #call the function
sw $v0, answer

li $v0, 4
la $a0, msg2 #outputting the msg "\nThe sum of all natural numbers upto n is : "
syscall

li $v0, 1
la $a0,answer #outputting the answer
syscall

li $v0, 10
syscall 

rec : 
	addi $sp,$sp, -8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	
	li $v0,0
	beq $a0,$zero,done # go to done if we've reached 0
    	
    	addi $a0,$a0,-1
    	jal rec
    	lw $a0, 0($sp)
    	
    	add $v0, $v0,$a0
done : 
	lw $a0,0($sp)
    	lw $ra,4($sp)
    	addi $sp,$sp,8
    	jr $ra	