.data
main:
  addiu $sp,$sp,-32
  sw $31,28($sp)
  sw $fp,24($sp)
  move $fp,$sp
  li $4,2000 # 0x7d0
  jal list_prime_numbers
  nop

  move $2,$0
  move $sp,$fp
  lw $31,28($sp)
  lw $fp,24($sp)
  addiu $sp,$sp,32
  j $31
  nop

$LC1:
  .ascii "%0.f\012 \000"
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
  trunc.w.d $f0,$f0,$2
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
  nop
  bc1f $L9
  nop

  sw $0,28($fp)
  li $2,2 # 0x2
  sw $2,24($fp)
  b $L5
  nop

$L8:
  lwc1 $f0,32($fp)
  nop
  lwc1 $f1,36($fp)
  nop
  trunc.w.d $f0,$f0,$2
  mfc1 $3,$f0
  lw $2,24($fp)
  nop
  bne $2,$0,1f
  div $0,$3,$2
  break 7
  mfhi $2
  bne $2,$0,$L6
  nop

  li $2,1 # 0x1
  sw $2,28($fp)
  b $L7
  nop

$L6:
  lw $2,24($fp)
  nop
  addiu $2,$2,1
  sw $2,24($fp)
$L5:
  lw $2,24($fp)
  nop
  mtc1 $2,$f0
  nop
  cvt.d.w $f2,$f0
  lwc1 $f4,32($fp)
  nop
  lwc1 $f5,36($fp)
  lui $2,%hi($LC0)
  lwc1 $f0,%lo($LC0)($2)
  nop
  lwc1 $f1,%lo($LC0+4)($2)
  nop
  div.d $f0,$f4,$f0
  c.le.d $f2,$f0
  nop
  bc1t $L8
  nop

$L7:
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
  lui $2,%hi($LC1)
  addiu $4,$2,%lo($LC1)
  jal printf
  nop

$L9:
  nop
  move $sp,$fp
  lw $31,44($sp)
  lw $fp,40($sp)
  addiu $sp,$sp,48
  j $31
  nop

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
  b $L11
  nop

$L12:
  lw $3,48($fp)
  li $2,10 # 0xa
  bne $2,$0,1f
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
  li $2,10 # 0xa
  bne $2,$0,1f
  div $0,$3,$2
  break 7
  mfhi $2
  mflo $2
  sw $2,48($fp)
$L11:
  lw $2,48($fp)
  nop
  bne $2,$0,$L12
  nop

  lw $3,32($fp)
  lw $2,24($fp)
  nop
  beq $3,$2,$L14
  nop

  lw $4,32($fp)
  jal is_prime
  nop

$L14:
  nop
  move $sp,$fp
  lw $31,44($sp)
  lw $fp,40($sp)
  addiu $sp,$sp,48
  j $31
  nop

reverseDigits:
  addiu $sp,$sp,-40
  sw $31,36($sp)
  sw $fp,32($sp)
  move $fp,$sp
  sw $4,40($fp)
  sw $0,24($fp)
  b $L16
  nop

$L17:
  lw $2,24($fp)
  nop
  sll $2,$2,1
  sll $3,$2,2
  addu $2,$2,$3
  lw $4,40($fp)
  li $3,10 # 0xa
  bne $3,$0,1f
  div $0,$4,$3
  break 7
  mfhi $3
  addu $2,$2,$3
  sw $2,24($fp)
  lw $3,40($fp)
  li $2,10 # 0xa
  bne $2,$0,1f
  div $0,$3,$2
  break 7
  mfhi $2
  mflo $2
  sw $2,40($fp)
$L16:
  lw $2,40($fp)
  nop
  bgtz $2,$L17
  nop

  lw $4,24($fp)
  jal isPalindrome
  nop

  nop
  move $sp,$fp
  lw $31,36($sp)
  lw $fp,32($sp)
  addiu $sp,$sp,40
  j $31
  nop

list_prime_numbers:
  addiu $sp,$sp,-48
  sw $31,44($sp)
  sw $fp,40($sp)
  move $fp,$sp
  sw $4,48($fp)
  sw $0,28($fp)
  sw $0,36($fp)
  li $2,1 # 0x1
  sw $2,24($fp)
  b $L19
  nop

$L25:
  li $2,2 # 0x2
  sw $2,32($fp)
  b $L20
  nop

$L23:
  lw $3,24($fp)
  lw $2,32($fp)
  nop
  bne $2,$0,1f
  div $0,$3,$2
  break 7
  mfhi $2
  bne $2,$0,$L21
  nop

  lw $2,28($fp)
  nop
  addiu $2,$2,1
  sw $2,28($fp)
  b $L22
  nop

$L21:
  lw $2,32($fp)
  nop
  addiu $2,$2,1
  sw $2,32($fp)
$L20:
  lw $3,32($fp)
  lw $2,24($fp)
  nop
  slt $2,$3,$2
  bne $2,$0,$L23
  nop

$L22:
  lw $2,28($fp)
  nop
  bne $2,$0,$L24
  nop

  lw $3,24($fp)
  li $2,1 # 0x1
  beq $3,$2,$L24
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

$L24:
  sw $0,28($fp)
  lw $2,24($fp)
  nop
  addiu $2,$2,1
  sw $2,24($fp)
$L19:
  lw $3,24($fp)
  lw $2,48($fp)
  nop
  slt $2,$2,$3
  beq $2,$0,$L25
  nop

  nop
  move $sp,$fp
  lw $31,44($sp)
  lw $fp,40($sp)
  addiu $sp,$sp,48
  j $31
  nop

$LC0:
  .word 0
  .word 1073741824
