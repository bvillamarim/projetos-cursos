


global data = "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\2º Dia\Pnad\Bancos de dados"
global result = "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\2º Dia\Pnad\Resultados"
global do = "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\2º Dia\Pnad\Do files"

cap mkdir "$result"

do "$do\0 - prepara_pnad"
do "$do\1 - resultados"
