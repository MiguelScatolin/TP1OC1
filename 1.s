	## código para testar funcionamento
	# li x10, 2
	# li x11, 1
	# jal x1, lei_de_ohm
	# jal x1, encerra_programa


lei_de_ohm:
	beq x10, x0, tensao # vai para a parte que calcula tensão caso a tensão seja 0
	beq x11, x0, resistencia # vai para a parte que calcula resistência caso a resistência seja 0
	beq x12, x0, corrente # vai para a parte que calcula corrente caso a corrente seja 0
tensao:
	beq x11, x0, retorna_zero # encerra caso mais de uma das grandezas seja 0 
	beq x12, x0, retorna_zero # encerra caso mais de uma das grandezas seja 0
	mul x10, x11, x12 # calcula a tensão usando V = R * I
	jal x0, final # vai para o final o programa
resistencia: 
	beq x10, x0, retorna_zero # encerra caso mais de uma das grandezas seja 0
	beq x12, x0, retorna_zero # encerra caso mais de uma das grandezas seja 0
	div x10, x10, x12 # calcula a resistência usando R = V / I
	jal x0, final # vai para o final o programa
corrente:
	beq x10, x0, retorna_zero # encerra caso mais de uma das grandezas seja 0
	beq x11, x0, retorna_zero # encerra caso mais de uma das grandezas seja 0
	div x10, x10, x11  # calcula a corrent usando I = V / R
	jal x0, final # vai para o final o programa
retorna_zero:
	li x10, 0
final:
	jalr x0, 0(x1) # retorna para o endereço e onde a procedure foi chamada

encerra_programa: