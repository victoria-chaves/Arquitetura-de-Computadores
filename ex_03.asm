.data
      Resultado:  .asciiz "Resultado = "     
.text
addi $t1, $zero, 10

andi $t2, $t1,1 #registrador 2 vai armazenar o resultado de andi

beq $t2,1,multiplica #se valor no registrador 2 for igual a 1 então vai pro label 'multiplica'
srl $t1,$t1,1  #se não entrar na label IMPAR então executa essa parte

j Exit 

multiplica: sll $t1,$t1,2
Exit:

li $v0, 4 
la $a0, Resultado
syscall 

li   $v0, 1	    # Escrita na tela
add  $a0, $t1, $zero
syscall
