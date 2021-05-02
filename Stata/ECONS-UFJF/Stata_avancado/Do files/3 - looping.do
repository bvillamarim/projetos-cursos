
clear


local teste = 1
di `teste'

local teste = "a"
di "`teste'"



*** Looping em lista arbitrária

foreach a in elemento1 elemento2 elemento3 {
	di in red "`a'"
}


local lista = "elemento1 elemento2 elemento3"
foreach l of local lista{
	di in red "`l'"
}


local lista = `""elemento 1" "elemento 2" "elemento 3""'
foreach l of local lista{
	di in red "`l'"
}



set obs 1000
foreach var of newlist x1-x20 {
	gen `var' = rnormal()
}


foreach v of varlist x1-x10{
	sum `v'
}




foreach num of numlist 1 4/8 13(2)21 103 {
	display `num'
}


foreach num of numlist 1 4/8 13(2)21 103 {
	display %03.0f `num'
}




local a = 0
forvalues i = 1/10{
	local a = `a' + `i'
}

di `a'



forvalues i = 1/10{
	if mod(`i',2) == 0{
		di "`i' é par"
	}
	else{
		di "`i' é ímpar"
	}
}



local lista = "primeiro segundo terceiro quarto"
tokenize `lista'

di "`1'"
di "`2'"
di "`3'"
di "`4'"

tokenize `lista'

while "`1'" != ""{
	di "`1'"
	macro shift
}


local lista = "primeiro segundo terceiro quarto"
local premio = `""ganha 10 pontos" "ganha 7 pontos" "ganha 4 pontos" "não ganha nada""'
tokenize `lista'

foreach p of local premio{
	di  "`1'" " "  "`p'"
	macro shift
}


local lista = "primeiro segundo terceiro quarto"
local premio = `""ganha 10 pontos" "ganha 7 pontos" "ganha 4 pontos" "não ganha nada""'

foreach l of local lista{
	foreach p of local premio{
			di  "`l'" " "  "`p'"
	}
}




cd "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\2º Dia\Pnad\Bancos de dados"

use pnad_mod, clear

cap mat drop S
foreach n of numlist 2 4{
	sum renda if sexo == `n'
	mat S = (nullmat(S)\(r(N),r(mean)))
}
	
mat list S




cap mat drop S
levelsof sexo, local(sex)
foreach n of local sex{
	sum renda if sexo == `n'
	mat S = (nullmat(S)\(r(N),r(mean)))
}
	
mat list S






/*


clear
set obs 100000
foreach var of newlist x1-x5 {
	gen `var' = rnormal()
}

gen x6 = runiform()

gen x7 = runiformint(1,2)
tab x7, g(dx7)

gen e = rnormal()

gen y = 0.8*x1 + 3.6*x2 + 5.2*x3 + 78*x4 + 12*x5 - 33*x6 + 235*dx71 + e

reg y x1-x6 dx71

reg y x1


reg y x1 x2


gen z = 12*x1 + x2^2*50


gen y1 = 0.8*x1 + 3.6*x2 + 5.2*x3 + 78*x4 + 12*x5 - 33*x6 + 235*dx71 + 10*z + e

reg y1 x1-x6 dx71 z

reg y1 x1-x6 dx71



*/

