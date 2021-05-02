****************************************************************************************************************************************************
*****************                 APOSTILA DO MINICURSO MICRODADOS COM O USO DO STATA                   ********************************************
************************                ECONS - FACULDADE DE ECONOMIA UFJF                              ********************************************
*******************************                  Outubro de 2017                                        ********************************************
****************************************************************************************************************************************************


use "$data\pnad_mod.dta", clear

global var = "renda masc fem branco nbranco educ migra nmigra" 

tabstat $var [fweight = peso], statistics( mean count p25 p50 p75 ) columns(statistics) save


mat E = r(StatTotal)'

cap erase "$result\tabela1.xlsx"
putexcel set "$result\tabela1", replace



putexcel C3 = mat(E)

local var = `""Salário" "Homens" "Mulheres" "Branco" "Não brancos" "Anos de estudo" "Migrantes" "Não migrantes""'

local c = 3
foreach v of local var{
	putexcel B`c' = "`v'"
	putexcel C`c', hcenter nformat(number_sep_d2)
	putexcel D`c', hcenter nformat(number_sep)
	putexcel E`c', hcenter nformat(number_sep_d2)
	putexcel F`c', hcenter nformat(number_sep_d2)
	putexcel G`c', hcenter nformat(number_sep_d2)

	local ++c
}

putexcel B1:G1 = "Tabela 1", merge hcenter border(bottom, double, black) 

putexcel B2:G2, border(bottom) 


putexcel B2 = "Variáveis", hcenter
putexcel C2 = "Média", hcenter
putexcel D2 = "Observações", hcenter
putexcel E2 = "1º Quartil", hcenter
putexcel F2 = "2º Quartil", hcenter
putexcel G2 = "3º Quartil", hcenter
 
putexcel B`c':G`c' = "Fonte: Elaborado pelos autores", merge border(top, double, black)

putexcel clear

***********************   Tabela 2  ********************************************
preserve
table uf sexo raca [fweight = peso], contents(mean renda ) replace
reshape wide table1, i(uf raca) j(sexo)
reshape wide table*, i(uf) j(raca)

mkmat table*, mat(A)


cap erase "$result\tabela2.xlsx"
putexcel set "$result\tabela2", replace



putexcel C4 = mat(A)



local uf = "RO AC AM RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF"
local c = 4
foreach u of local uf{
	putexcel B`c' = "`u'", hcenter
	putexcel C`c', hcenter nformat(number_sep_d2)
	putexcel D`c', hcenter nformat(number_sep_d2)
	putexcel E`c', hcenter nformat(number_sep_d2)
	putexcel F`c', hcenter nformat(number_sep_d2)
	putexcel G`c', hcenter nformat(number_sep_d2)
	putexcel H`c', hcenter nformat(number_sep_d2)
	local ++c

}
putexcel B1:H1 = "Tabela 2", merge hcenter border(bottom, double, black) 
putexcel B3:H3, border(bottom) 


putexcel B2:B3 = "Estados", merge hcenter
putexcel C2:D2 = "Brancos", merge hcenter
putexcel E2:F2 = "Negros", merge hcenter
putexcel G2:H2 = "Pardos", merge hcenter

putexcel C3 = "Homens", hcenter
putexcel E3 = "Homens", hcenter
putexcel G3 = "Homens", hcenter

putexcel D3 = "Mulheres", hcenter
putexcel F3 = "Mulheres", hcenter
putexcel H3 = "Mulheres", hcenter

putexcel B`c':H`c' = "Fonte: Elaborado pelos autores", merge border(top, double, black)

putexcel clear
***************************************************************************************


svyset V4618 [pweight=peso], strata(V4617) vce(linearized) singleunit(centered) || _n


cap erase "$result\tabela3.xlsx"
putexcel set "$result\tabela3", replace

local c = 3
foreach v of varlist masc branco migra{
	svy: mean renda, over(`v')
	mat M = e(b)
	putexcel C`c' = M[1,1] D`c' = M[1,2], hcenter nformat(number_sep_d2)
	
	svy: reg renda `v'
	mat B = e(b)
	
	if `e(p)' > 0.05 & `e(p)' <= 0.1{
		local a = "*"
		local dif :  display  %10,2fc   -B[1,1] "`a'"
	}
	else if `e(p)'> 0.01  & `e(p)' <= 0.05{
		local a = "**"
		local dif :  display  %10,2fc   -B[1,1] "`a'"
	}
	else if `e(p)' <= 0.01{
		local a = "***"
		local dif :  display  %10,2fc  -B[1,1] "`a'"
	}
	else{
		local a = ""
		local dif :  display  %10,2fc   -B[1,1] "`a'"
	}
	putexcel E`c' = "`dif'", hcenter   

	local ++c
}
	



*********************************************************************************

svy: reg renda educ masc branco migra 

outreg2 using "$result\tabela4", excel bd(2) sd(2) replace

cap tab ocup, g(docup)
svy: probit docup1 educ masc branco migra 
outreg2 using "$result\tabela4", excel bd(2) sd(2) 
