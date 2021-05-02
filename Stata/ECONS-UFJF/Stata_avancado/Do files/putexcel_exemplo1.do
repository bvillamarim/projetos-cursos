
global data = "C:\Users\Bianca\Mestrado Economia Aplicada\Stata\Avançado\Bancos de dados"


global result = "C:\Users\Bianca\Mestrado Economia Aplicada\Stata\Avançado\Resultados"

cap mkdir "$result"


use "$data\pnad.dta", clear


table UF V0302, contents(mean V8005 mean V4719 ) replace

reshape wide table1 table2, i(UF) j(V0302)

destring UF, replace
mkmat UF table12 table22 table14 table24, mat(A)

cap erase "$result\tabela.xlsz"
putexcel set "$result\tabela", replace
putexcel C4 = matrix(A)


putexcel C1:G1 = "Tabela", merge hcenter border(bottom, double, black) 


putexcel C2:C3 = "Estados", merge hcenter
putexcel D2:E2 = "Homens", merge hcenter
putexcel F2:G2 = "Mulheres", merge hcenter

putexcel D3 = "Idade Média", hcenter
putexcel E3 = "Renda Média", hcenter

putexcel F3 = "Idade Média", hcenter
putexcel G3 = "Renda Média", hcenter

putexcel C3:G3, border(bottom) 


local fim = `=_N' + 3
di `fim'

forval c = 4/ `fim'{
	putexcel C`c', hcenter nformat(number_sep)
	putexcel D`c', hcenter nformat(number_sep_d2)
	putexcel E`c', hcenter nformat(number_sep_d2)
	putexcel F`c', hcenter nformat(number_sep_d2)
	putexcel G`c', hcenter nformat(number_sep_d2)
}

local ++fim 
putexcel C`fim':G`fim' = "Fonte: Elaborado pelos autores", merge border(top, double, black)

