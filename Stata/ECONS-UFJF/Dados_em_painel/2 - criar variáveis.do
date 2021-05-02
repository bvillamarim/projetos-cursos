
*** Formato Long

use "C:\0 - IGOR\Softwares\STATA\Curso STATA\Pos gradua��o 2017\2� Dia\Dados em painel\Bancos de dados\painel.dta", clear

*** Gerar vari�vel contendo o primeiro valor da s�rie por indiv�duo
by id (ano), sort: gen first = valor[1]

*** Gerar �ndice por indiv�duo
bys id (ano): gen indice = valor / valor[1]

*** Gerar taxa de crescimento
bys id (ano): gen crescimento = (valor - valor[_n-1]) / valor[_n-1]

*** Vari�vel lag
bys id (ano): gen lag = valor[_n-1]
gen lag1 = valor[_n-1]
gen lag2 = l.valor


*** Gerar vari�vel com total de observa��es por indiv�duo
bys id (ano): egen anos = count(valor)

bys id (ano): gen anoss = _N


*** Vari�vel lag
bysort id (ano): gen xn_1 = valor[_n-1]

***********  Declarar que os dados est�o em painel e usar comando espec�ficos 
xtset id ano

gen lvalor = L.valor


gen diff = D.valor



xtline valor

xtdes,i(id) t(ano)













