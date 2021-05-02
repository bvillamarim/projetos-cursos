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
 
 
 
 
 

use "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\Bancos de dados\reshape.dta", clear

reshape wide renda, i(ano regiao) j(area)


use "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\Bancos de dados\pnad.dta", clear
table UF V0302, contents(mean V8005 mean V4719 ) replace
reshape wide table1 table2, i(UF) j(V0302)



