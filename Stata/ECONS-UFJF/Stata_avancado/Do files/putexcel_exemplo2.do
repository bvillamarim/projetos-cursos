global data = "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\2º Dia\Pnad\Bancos de dados"


global result = "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\2º Dia\Resultados"

cap mkdir "$result"


cap erase "$result\teste_media.xlsx"

clear 
set obs 1000
gen ano = runiformint(2000,2010)

tab ano


gen x1 = rnormal(500,300)
gen x2 = runiformint(1,2)

tab x2

putexcel clear

	putexcel set "$result\teste_media", replace 

	putexcel A1:D1 = "Tabela X - Teste de médias", merge hcenter border(bottom, double, black) 
	*putexcel A2:D2 = "",  border(bottom)
	
	putexcel A2 = "Ano" , border(bottom)
	putexcel B2 = "Grupo 1" , border(bottom)
	putexcel C2 = "Grupo 2" , border(bottom)
	putexcel D2 = "Diferença" , border(bottom)

	local linha = 2
	
	levelsof ano, local(year)
	foreach y of local year{
		local linha = `linha' + 1 
		ttest x1 if ano== `y', by(x2) unequal
		
		putexcel A`linha' = "`y'"
		putexcel B`linha' = `r(mu_2)', hcenter nformat(number_sep_d2)
		putexcel C`linha' = `r(mu_1)', hcenter nformat(number_sep_d2)

		if `r(p)' > 0.05 & `r(p)' <= 0.1{
			local a = "*"
			local dif :  display  %10.2fc (r(mu_2)-r(mu_1)) "`a'"
		}
		else if `r(p)'> 0.01  & `r(p)' <= 0.05{
			local a = "**"
			local dif :  display  %10.2fc (r(mu_2)-r(mu_1)) "`a'"
		}
		else if `r(p)' <= 0.01{
			local a = "***"
			local dif :  display  %10.2fc (r(mu_2)-r(mu_1)) "`a'"
		}
		else{
			local a = ""
			local dif :  display  %10.2fc (r(mu_2)-r(mu_1)) "`a'"
		}
		putexcel D`linha' = "`dif'", hcenter
	}
		
	
	local linha = `linha' + 1
	putexcel A`linha':D`linha' = "Fonte: ", merge  border(top, double, black)



