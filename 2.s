primo:
    addi sp, sp, -8 # ajustando o stack para reservar espaço para registradores temporários
    sw x5, 4(sp) # guarda o valor de x5 no stack para libera-lo para uso na procedure
    sw x6, 0(sp) # guarda o valor de x6 no stack para libera-lo para uso na procedure
    addi x6 x0, 1 # atribui 1 a uma variavel temporaria
    bge x6, x10, retorna_falso # pula para retorna_falso se n <= 1
    addi x5, x0, 2 # faz d = 2
for:
    bge x5, x10, retorna_verdadeiro # testa fim do loop
    rem x6, x10, x5 # armazena n%d em x6
    beq x6, x0, retorna_falso # pula para retorna_falso caso n%d seja igual a 0
    addi x5, x5, 1 # incrementa d em 1
    jal x0, for # volta pro inicio do for para a próxima iteração
retorna_verdadeiro:
    addi x11, x0, 1 # atribui 1 ao retorno
    jal x0, encerra_primo # pula para o fim da procedure
retorna_falso:
    addi x11, x0, 0 # atribui 0 ao retorno
encerra_primo:
    lw x6, 0(sp) # recupera o valore original de x6 do stack para não interfirir no programa principal
    lw x5, 4(sp) # recupera o valore original de x5 do stack para não interfirir no programa principal
    addi sp, sp, 8 # liberando o espaço reservado no stack
    jalr x0, 0(x1) # retorna para o endereço e onde a procedure foi chamada