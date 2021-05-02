


global data = "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\2º Dia\Pnad\Bancos de dados"


global result = "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\2º Dia\Resultados"

cap mkdir "$result"


cap erase "$result\teste.xlsx"
putexcel set "$result\teste"


putexcel A2 = "Célula 1" B2 = "Célula 2" C2 = "Célula 3", hcenter
putexcel A3:C3 = "Células mescladas", merge hcenter
putexcel A4 = 2018, hcenter nformat(number)
putexcel B4 = 20.12 , hcenter nformat(number_sep_d2)
putexcel C4 = 2018, hcenter nformat(number_sep)


putexcel A1:C1 = "Título", merge hcenter border(bottom, double, black) 
putexcel A2:C2, hcenter border(bottom) 

putexcel A5:C5 = "Fonte", merge border(top, double, black) 
