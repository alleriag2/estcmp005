#read 2 integer numbers and print out the larger one

.data # data section
mes1: .asciiz "\n\nEnter the first integer number: "
mes2: .asciiz "Enter the second integer number: "
mes3: .asciiz "The larger integer number is: "

.text # code section
li $v0, 4 #print a string "mes1"
la $a0, mes1
syscall

li $v0, 5 #read the first integer
syscall
move $t0, $v0

li $v0, 4 #print a string "mes2"
la $a0, mes2
syscall

li $v0, 5 #read the second integer
syscall
move $t1, $v0

slt $s0, $t0, $t1
bne $s0, $zero, print_num  #jumps to print_num if $t0 is larger
move $t0, $t1  #else: $t1 is larger

print_num:
li $v0, 4 #print a string "mes3"
la $a0, mes3 
syscall

li $v0, 1 #print the larger int number
move $a0, $t0
syscall

li $v0, 10 # system call for exit
syscall