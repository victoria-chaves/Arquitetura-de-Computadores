#
# Programa para ler dois números do teclado e imprimir na tela a soma dos dois.
#

.data
      Numero_1:   .asciiz "Informe o primeiro numero: "
      Numero_2:   .asciiz "Informe o segundo numero: "
      Resultado:  .asciiz "Resultado = "

.text
      li   $v0, 4           # Escrita na tela
      la   $a0, Numero_1    #  
      syscall
      
      li   $v0, 5           # Leitura de teclado
      syscall
      
      add  $t0, $v0, $zero  # Copia $v0 em $t0
      
      li   $v0, 4           # Escrita na tela
      la   $a0, Numero_2    #  
      syscall
      
      li   $v0, 5           # Leitura de teclado
      syscall
      
      add  $t1, $v0, $zero  # Copia $v0 em $t1
      
      add  $t2, $t0, $t1    # Resultado = Numero_1 + Numero_2

      li   $v0, 4 
      la   $a0, Resultado
      syscall 
      
      li   $v0, 1	    # Escrita na tela
      add  $a0, $t2, $zero
      syscall
      
      li   $v0, 10          # system call for exit
      syscall               # we are out of here.
      
