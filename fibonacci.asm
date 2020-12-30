# Compute first twelve Fibonacci numbers and put in array, then print
      .data
      Numero_1:   .asciiz "Informe o primeiro numero da serie: "
      Numero_2:    .asciiz "Informe o segundo numero da serie: "
      Numero_3:    .asciiz "Informe a quantidade de termos: "
fibs: .word   0 : 9        # "array" of 12 words to contain fib values
#size: .word               # size of "array" 
      .text
      
      #pedir a entrada dos numeros
      li   $v0, 4           # Escrita na tela
      la   $a0, Numero_1     #  
      syscall
      li   $v0, 5           # Leitura de teclado
      syscall
      
      add  $t6, $v0, $zero  # Copia $v0 em $t6 (numero 1 em t6)
      
      li   $v0, 4           # Escrita na tela
      la   $a0, Numero_2    #  
      syscall
      
      li   $v0, 5           # Leitura de teclado
      syscall
      
      add  $t7, $v0, $zero  # Copia $v0 em $t7 (numero 2 em t7)  
      
      li   $v0, 4           # Escrita na tela
      la   $a0, Numero_3    #  
      syscall
      
      li   $v0, 5           # Leitura de teclado
      syscall
      
      add  $t5, $v0, $zero  # Copia $v0 em t5 (tamanho do vetor)
      
#####################################################################
      la   $t0, fibs        # load address of array
    #  la   $t5, $s1        # load address of size variable
     # lw   $t5, 0($s1)      # load array size
      add  $t2, $t6, $zero  # numero 1 is first Fib. number
      sw   $t2, 0($t0)      # F[0] = numero_1
      add  $t2, $t7, $zero  # numero 2 is the second Fib. number
      sw   $t2, 4($t0)      # F[1] = numero_2
      addi $t1, $t5, -2     # Counter for loop, will execute (size-2) times
loop: lw   $t3, 0($t0)      # Get value from array F[n] 
      lw   $t4, 4($t0)      # Get value from array F[n+1]
      add  $t2, $t3, $t4    # $t2 = F[n] + F[n+1]
      sw   $t2, 8($t0)      # Store F[n+2] = F[n] + F[n+1] in array
      addi $t0, $t0, 4      # increment address of Fib. number source
      addi $t1, $t1, -1     # decrement loop counter
      bgtz $t1, loop        # repeat if not finished yet.
      la   $a0, fibs        # first argument for print (array)
      add  $a1, $zero, $t5  # second argument for print (size)
      jal  print            # call print routine. 
      li   $v0, 10          # system call for exit
      syscall               # we are out of here.
		
#########  routine to print the numbers on one line. 

      .data
space:.asciiz  " "          # space to insert between numbers
head: .asciiz  "The Fibonacci numbers are:\n"
      .text
print:add  $t0, $zero, $a0  # starting address of array
      add  $t1, $zero, $a1  # initialize loop counter to array size
      la   $a0, head        # load address of print heading
      li   $v0, 4           # specify Print String service
      syscall               # print heading
out:  lw   $a0, 0($t0)      # load fibonacci number for syscall
      li   $v0, 1           # specify Print Integer service
      syscall               # print fibonacci number
      la   $a0, space       # load address of spacer for syscall
      li   $v0, 4           # specify Print String service
      syscall               # output string
      addi $t0, $t0, 4      # increment address
      addi $t1, $t1, -1     # decrement loop counter
      bgtz $t1, out         # repeat if not finished
      jr   $ra              # return
	
