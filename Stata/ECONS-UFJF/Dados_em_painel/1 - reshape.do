******************************************************************************************************
*********** 	ELABORADO PELO ECONS COMO PARTE DA APOSTILA DE INTRODUÇÃO AO STATA       *************
**************************                  RESHAPE*          ****************************************
******************************************************************************************************

/*
Este comando tem a função de converter dados que estejam sobrepostos verticalmente para horizontalmente ou vice-versa. 
Abaixo será apresentado um exemplo de como deve ser feito.

*/

webuse reshape1, clear

/*
LIstando os dados através do comando <code> list </code>
*/

list

/*
A conversão dos dados verticais para o formato horizontal se dá com o seguinte comando:
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
