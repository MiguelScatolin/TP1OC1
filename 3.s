# arr => x10
# n => x11
insertionSort:
    addi sp, sp, -20 # ajustando o stack para reservar espaço para registradores temporários
    sw x5, 16(sp) # guarda o valor de x5 no stack para libera-lo para uso na procedure
    sw x6, 12(sp) # guarda o valor de x6 no stack para libera-lo para uso na procedure
    sw x7, 8(sp) # guarda o valor de x7 no stack para libera-lo para uso na procedure
    sw x28, 4(sp) # guarda o valor de x28 no stack para libera-lo para uso na procedure
    sw x29, 0(sp) # guarda o valor de x29 no stack para libera-lo para uso na procedure

    addi x5 x0, 1 # i = 1
for:
    bge x5, x11, encerra_ordenacao # testa fim do for
    addi x5, x5, 1 # incrementa i em 1
    slli x28, x5, 2 # multiplica i por 4 para poder navegar i itens de 4 bytes na memória
    add x28, x28, x10 # calcula o enderço do elemento i do array
    lw x6, 0(x28) # key = arr[i]
    addi x7, x5, -1 # j = i - 1

while:
    blt x7, x0, fim_while # checa primeira condição do while j >= 0
    slli x28, x7, 2 # multiplica j por 4 para poder navegar j itens de 4 bytes na memória
    add x28, x28, x10 # calcula o enderço do elemento j do array
    lw x29, 0(x28) # obtem o valor de arr[j]
    bge x6, x29, fim_while # checa segunad condição do while arr[j] > key
    sw x29, 4(x28) # arr[j + 1] = arr[j]
    addi x7, x7, -1 # j = j - 1
    jal x0, while # volta pro inicio do while

fim_while:
    jal x0, for # volta pro inicio do for para a próxima iteração

encerra_ordenacao:
    lw x29, 0(sp) # recupera o valore original de x29 do stack para não interfirir no programa principal
    lw x28, 4(sp) # recupera o valore original de x28 do stack para não interfirir no programa principal
    lw x7, 8(sp) # recupera o valore original de x7 do stack para não interfirir no programa principal
    lw x6, 12(sp) # recupera o valore original de x6 do stack para não interfirir no programa principal
    lw x5, 16(sp) # recupera o valore original de x5 do stack para não interfirir no programa principal
    addi sp, sp, 20 # liberando o espaço reservado no stack
    jalr x0, 0(x1) # retorna para o endereço e onde a procedure foi chamada