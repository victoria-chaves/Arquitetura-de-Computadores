 .data    
fx: .word   0 : 9        # "array" of 8 words to contain f(x) values

 .text
 
 la $t0, fx  #carrega endereço de f(x)
 add $t1, $zero, 9  #tamanho do vetor 
 
 ######### armazenando valores no vetor F(x) #########
 addi  $t2, $zero, 4  
 sw   $t2, 0($t0)      # F[0] = 4
 
 addi  $t2,$zero , 11 
 sw   $t2, 4($t0)      # F[1] = 11
 
 add  $t2,  $zero, 16  
 sw   $t2, 8($t0)      # F[2] = 16
 
 add  $t2, $zero, 19  
 sw   $t2, 12($t0)      # F[3] = 19
 
 add  $t2,$zero, 20
 sw   $t2, 16($t0)      # F[4] = 20
 
 add  $t2, $zero  , 19
 sw   $t2, 20($t0)      # F[5] = 19
 
 add  $t2, $zero  , 16
 sw   $t2, 24($t0)      # F[6] = 16

 add  $t2, $zero , 11 
 sw   $t2, 28($t0)      # F[7] = 11
 
 add  $t2, $zero, 4  
 sw   $t2, 32($t0)      # F[8] = 4
 ##############################################################
 
 ###loop da multiplicação de f(1) até f(7)#########
 addi $t2,$zero,0  #limpando t2
 
 addi $t2,$zero,7 # i = 7

 loop_mult: lw $t5, 4($t0)
       sll $t5,$t5,1
       sw $t5, 4($t0)
      addi $t0, $t0, 4
      addi $t2, $t2, -1  
       bgtz $t2, loop_mult


la $t0,fx
 loop_soma: lw $t3,0($t0)
  add $t4, $t3, $t4
  addi $t0, $t0, 4
  addi $t1, $t1, -1 
  bgtz $t1, loop_soma
  
  #######fazer divisão#######
  srl $t4,$t4,1
  
  #### APRESENTAR RESULTADO ####
  li $v0,1
  move $a0,$t4
  syscall
 
