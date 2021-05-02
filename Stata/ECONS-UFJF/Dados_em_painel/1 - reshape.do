******************************************************************************************************
*********** 	ELABORADO PELO ECONS COMO PARTE DA APOSTILA DE INTRODU��O AO STATA       *************
**************************                  RESHAPE*          ****************************************
******************************************************************************************************

/*
Este comando tem a fun��o de converter dados que estejam sobrepostos verticalmente para horizontalmente ou vice-versa. 
Abaixo ser� apresentado um exemplo de como deve ser feito.

*/

webuse reshape1, clear

/*
LIstando os dados atrav�s do comando <code> list </code>
*/

list

/*
A convers�o dos dados verticais para o formato horizontal se d� com o seguinte comando:
*/
reshape long inc ue, i(id) j(year)

/*
Listando os resultados 
*/

list, sepby(id)



/*
Convertendo os dados para o formato vertical
*/

reshape wide inc ue, i(id) j(year)

/*
Usando outro banco de dados
*/

webuse reshape3, clear

/*
Listando os dados
*/

list

/*
Convertendo dados verticais para horizontais.
*/

reshape long inc@r ue, i(id) j(year)

 /*
 Listando os resultados.
*/

 list, sepby(id)
