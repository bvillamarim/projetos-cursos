
*** Formato Long

use "C:\0 - IGOR\Softwares\STATA\Curso STATA\Pos graduação 2017\2º Dia\Dados em painel\Bancos de dados\painel.dta", clear

*** Gerar variável contendo o primeiro valor da série por indivíduo
by id (ano), sort: gen first = valor[1]

*** Gerar índice por indivíduo
bys id (ano): gen indice = valor / valor[1]

*** Gerar taxa de crescimento
bys id (ano): gen crescimento = (valor - valor[_n-1]) / valor[_n-1]

*** Variável lag
bys id (ano): gen lag = valor[_n-1]
gen lag1 = valor[_n-1]
gen lag2 = l.valor


*** Gerar variável com total de observações por indivíduo
bys id (ano): egen anos = count(valor)

bys id (ano): gen anoss = _N


*** Variável lag
bysort id (ano): gen xn_1 = valor[_n-1]

***********  Declarar que os dados estão em painel e usar comando específicos 
xtset id ano

gen lvalor = L.valor


gen diff = D.valor



xtline valor

xtdes,i(id) t(ano)













