	beq x10, x0, tensao # vai para a parte que calcula tensão caso a tensão seja 0
	beq x11, x0, resistencia # vai para a parte que calcula resistência caso a resistência seja 0
	beq x12, x0, corrente # vai para a parte que calcula corrente caso a corrente seja 0
tensao:
	beq x11, x0, final # encerra caso mais de uma das grandezas seja 0 
	beq x12, x0, final # encerra caso mais de uma das grandezas seja 0
	mul x10, x11, x12 # calcula a tensão usando V = R * I
	jal x0, final # vai para o final o programa
resistencia: 
	beq x10, x0, final # encerra caso mais de uma das grandezas seja 0
	beq x12, x0, final # encerra caso mais de uma das grandezas seja 0
	div x11, x10, x12 # calcula a resistência usando R = V / I
	jal x0, final # vai para o final o programa
corrente:
	beq x10, x0, final # encerra caso mais de uma das grandezas seja 0
	beq x11, x0, final # encerra caso mais de uma das grandezas seja 0
	div x12, x10, x11  # calcula a corrent usando I = V / R
final: