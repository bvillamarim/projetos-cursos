******************************************************************************************************
*********** 	ELABORADO PELO ECONS COMO PARTE DA APOSTILA DE INTRODU��O AO STATA       *************
**************************             Appned - painel        ****************************************
******************************************************************************************************



*https://www.ssc.wisc.edu/sscc/pubs/stata_panel.htm

*http://www.ls3.soziologie.uni-muenchen.de/downloads/lehre/lehre_alt/statacommands.pdf


cd "C:\0 - IGOR\Softwares\STATA\Curso STATA\Pos gradua��o 2017\2� Dia\Dados em painel\Bancos de dados"

use append_2016, clear

append using append_2017

order id ano

sort id ano

xtset id ano



bys id (ano): replace var6 = var6[_n+1] 

bys id (ano): replace var6 = var6[_n+1] if var6[_n] == ""


