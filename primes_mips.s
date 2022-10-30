#THABANG ELIA NKOKO
#202101287
#ELECTRONICS ENGINEERING
# Name and general description of program
# ----------------------------------------
# Data declarations in this section.
.data
# program specific data declarations
# ----------------------------------------
range:      .word   2000    
ii:         .word   1
jay:         .word   0
kay:         .word   0
reversed:   .word   0
remainder:  .word   0
original:   .word   0
count :     .word   0

# Program code in this section.
.text
.globl main
.end main
# main:
# -----
# program code goes here.
jal start
start:
   
    lw $a0, range  # load 2000 as argument in reg $4  (direct mode addressing )
    jal list_prime_numbers  # jump to

list_prime_numbers:
  addiu $sp,$sp,-20    # preserve registers
  sw $ra,4($sp)  #return pointer
  sw $fp,0($sp)  # return pointer
  #Assign arguments
  sw $a1,16($fp)
  sw $a2,12($fp)
  sw $a3,8($fp)
  lw $v0, ii
 nop
while:
  beg $vo , range , $NEXT_DO1
  add $t1 ,$t1, $v0
  addi $v0 , $v0 ,1 

 $NEXT_DO1
  nop
  move $sp,$fp
  lw $31,4($sp)
  lw $fp,0($sp)
  addiu $sp,$sp,20    #clear
  j $ra
  nop

$NEXT_DO1:
  li $v0,2 
  sw $2,32($fp)
  lw $3,32($fp)
  lw $2,24($fp)
  nop
  slt $2,$3,$2
  bne $2,$0,$DO2
  nop

  $DO2:
  lw $3,24($fp)
  lw $2,32($fp)
  nop
  div $0,$3,$2
  break 7
  mfhi $2
  bne $2,$0,$DO3
  nop

  lw $2,28($fp)
  nop
  addiu $2,$2,1
  sw $2,28($fp)
 
  lw $2,28($fp)
  nop
  bne $2,$0,$L24
  nop

  lw $3,24($fp)
  li $2,1 
  beq $3,$2,$DO4
  nop

  lw $3,24($fp)
  lw $2,24($fp)
  nop
  mult $3,$2
  mflo $2
  sw $2,36($fp)
  lw $4,36($fp)
  jal reverseDigits
  nop

  $DO3:
  lw $2,32($fp)
  nop
  addiu $2,$2,1
  sw $2,32($fp)


  $DO4:
  sw $0,28($fp)
  lw $2,24($fp)
  nop
  addiu $2,$2,1
  sw $2,24($fp)

  reverseDigits:
  addiu $sp,$sp,-40 #ASSIGN
  sw $31,36($sp)
  sw $fp,32($sp)
  move $fp,$sp
  sw $4,40($fp)
  sw $0,24($fp)
  lw $2,40($fp)
  nop
  bgtz $2,$DO5
  nop
  lw $4,24($fp)
  jal isPalindrome
  nop

  nop
  move $sp,$fp
  lw $31,36($sp)
  lw $fp,32($sp)
  addiu $sp,$sp,40    #CLEAR
  j $31
  nop

$DO5:
  lw $2,24($fp)
  nop
  sll $2,$2,1
  sll $3,$2,2
  addu $2,$2,$3
  lw $4,40($fp)
  li $3,10 
  div $0,$4,$3
  break 7
  mfhi $3
  addu $2,$2,$3
  sw $2,24($fp)
  lw $3,40($fp)
  li $2,10 
  div $0,$3,$2
  break 7
  mfhi $2
  mflo $2
  sw $2,40($fp)

isPalindrome:
  addiu $sp,$sp,-48
  sw $31,44($sp)
  sw $fp,40($sp)
  move $fp,$sp
  sw $4,48($fp)
  sw $0,24($fp)
  sw $0,28($fp)
  sw $0,32($fp)
  lw $2,48($fp)
  nop
  sw $2,32($fp)

  lw $2,48($fp)
  nop
  bne $2,$0,$DO5B
  nop

  lw $3,32($fp)
  lw $2,24($fp)
  nop
  beq $3,$2,$DO6
  nop

  lw $4,32($fp)
  jal is_prime
  nop

  $DO5B:
  lw $3,48($fp)
  li $2,10 
  div $0,$3,$2
  break 7
  mfhi $2
  sw $2,28($fp)
  lw $2,24($fp)
  nop
  sll $2,$2,1
  sll $3,$2,2
  addu $3,$2,$3
  lw $2,28($fp)
  nop
  addu $2,$3,$2
  sw $2,24($fp)
  lw $3,48($fp)
  li $2,10 
  div $0,$3,$2
  break 7
  mfhi $2
  mflo $2
  sw $2,48($fp)

$DO6:
  nop
  move $sp,$fp
  lw $31,44($sp)
  lw $fp,40($sp)
  addiu $sp,$sp,48
  j $31
  nop

  is_prime:
  addiu $sp,$sp,-48
  sw $31,44($sp)
  sw $fp,40($sp)
  move $fp,$sp
  sw $4,48($fp)
  lw $2,48($fp)
  nop
  mtc1 $2,$f0
  nop
  cvt.d.w $f0,$f0
  mov.d $f12,$f0
  jal sqrt
  nop

  swc1 $f0,32($fp)
  swc1 $f1,36($fp)
  lwc1 $f0,32($fp)
  nop
  lwc1 $f1,36($fp)
  nop
  cvt.d.w $f0,$f0
  lwc1 $f2,32($fp)
  nop
  lwc1 $f3,36($fp)
  nop
  sub.d $f0,$f2,$f0
  mtc1 $0,$f2
  nop
  mtc1 $0,$f3
  nop
  c.eq.d $f0,$f2

  move $sp,$fp
  lw $31,44($sp)
  lw $fp,40($sp)
  addiu $sp,$sp,48
  j $31
  nop

  sw $0,28($fp)
  li $2,2 # 0x2
  sw $2,24($fp)
  
  lw $2,24($fp)
  nop
  mtc1 $2,$f0
  nop
  cvt.d.w $f2,$f0
  lwc1 $f4,32($fp)
  nop
  lwc1 $f5,36($fp)
  nop
  
  div.d $f0,$f4,$f0
  c.le.d $f2,$f0
  nop
  bc1t $DO7
  nop

  $DO7:
  lwc1 $f0,32($fp)
  nop
  lwc1 $f1,36($fp)
  nop
  mfc1 $3,$f0
  lw $2,24($fp)
  nop
  div $0,$3,$2
  mfhi $2
  bne $2,$0,$DO8
  nop

  li $2,1 
  sw $2,28($fp)
  lw $2,28($fp)
  nop
  bne $2,$0,$L9
  nop

  lwc1 $f2,32($fp)
  nop
  lwc1 $f3,36($fp)
  lwc1 $f0,32($fp)
  nop
  lwc1 $f1,36($fp)
  nop
  mul.d $f0,$f2,$f0
  mfc1 $6,$f0
  mfc1 $7,$f1
  jal printf
  nop

  $DO8:
  lw $2,24($fp)
  nop
  addiu $2,$2,1
  sw $2,24($fp)



syscall
# Done, terminate program.
li $v0, 10      # Load value immediate into destination register.(immediate mode)
syscall # all done!
.end main