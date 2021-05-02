****************************************************************************************************************************************************
*****************                 APOSTILA DO MINICURSO MICRODADOS COM O USO DO STATA                   ********************************************
************************                ECONS - FACULDADE DE ECONOMIA UFJF                              ********************************************
*******************************                  Outubro de 2017                                        ********************************************
****************************************************************************************************************************************************



/*

! "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://www.stata.com/features/example-graphs/

! "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://www.stata.com/support/faqs/graphics/gph/stata-graphs/

! "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://www.surveydesign.com.au/tipsgraphs.html

! "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://www.ssc.wisc.edu/sscc/pubs/4-24.htm

! "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://stats.idre.ucla.edu/stata/modules/graph8/intro/introduction-to-graphs-in-stata/

! "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" http://www.stata-press.com/books/visual-guide-to-stata-graphics/index.html#ebook

*/



/*

https://www.stata.com/features/example-graphs/

https://www.stata.com/support/faqs/graphics/gph/stata-graphs/

https://www.surveydesign.com.au/tipsgraphs.html

https://www.ssc.wisc.edu/sscc/pubs/4-24.htm

https://stats.idre.ucla.edu/stata/modules/graph8/intro/introduction-to-graphs-in-stata/

http://www.stata-press.com/books/visual-guide-to-stata-graphics/index.html#ebook

*/


cd "H:\Monitoria Flávia\1º dia"

use "Banco de dados\aula1.dta", clear



histogram renda [w = peso]

histogram lnrenda [w = peso] 




**************************************************************************************************************
graph box lnrenda [w = peso]

graph box lnrenda [w = peso], by(genero) 





***************************************************************************************************************


scatter renda idade  [w = peso], msize(.2)

scatter lnrenda idade   if genero ==1 [w = peso], msize(.2)


tw lfit lnrenda idade [w = peso]

tw lfitci lnrenda idade [w = peso]


twoway (scatter lnrenda idade [w = peso], msize(.2)) ///
 (lfit lnrenda idade [w = peso]) 


twoway (scatter lnrenda idade [w= peso], msize(.2)) ///
	(lfitci lnrenda  idade [w = peso]) 


********************************************************************************************************************

kdensity lnrenda [w = peso]
 
kdensity lnrenda if  genero == 2 [w = peso]

kdensity lnrenda if genero == 1 [w = peso], addplot(kdensity lnrenda if genero == 2 [w = peso]) ///
	legend(order(1 "Homem" 2 "Mulher")) title("Densidade") note("Fonte: Elaborado pelo Econs")






twoway (scatter lnrenda idade [w= peso], msize(.2)) ///
	(qfit lnrenda  idade [w = peso]) 


**************************************************************************************************************************




*help twoway bar

cd "C:\0 - IGOR\Softwares\STATA\Curso STATA\6 - Pos graduação 2017\1º Dia\"

use "Bancos de dados\pnad_mod.dta", clear


recode idade (0/5 = 1) (6/10 = 2) (11/15 = 3) (16/20 = 4) (21/25 = 5) (26/30 = 6) ///
	(31/35 = 7) (36/40 = 8) (41/45 = 9) (46/50 = 10) (51/55 = 11) ///
	(56/60 = 12) (61/65 = 13) (66/70 = 14) (71/75 = 15) (76/80 = 16) (81/max = 17), gen(idade_grupo)

tab sexo, g(dsexo)


collapse (sum) dsexo1 dsexo2, by(idade_grupo)

drop if idade_grupo == .

replace dsexo1 = -dsexo1

 *       . replace femtotal = femtotal/1e+6

         twoway ///
                 bar dsexo1 idade_grupo, horizontal xvarlab(Males) ///
          ||     bar  dsexo2 idade_grupo, horizontal xvarlab(Females) ///
          ||    , ylabel(1(1)17, angle(horizontal) valuelabel labsize(*.8)) 		  ///
            xtitle("Population in millions") ytitle("") ///
            xlabel(-10 "10" -7.5 "7.5" -5 "5" -2.5 "2.5" 2.5 5 7.5 10) ///
            legend(label(1 Males) label(2 Females)) /// 
            title("US Male and Female Population by Age") ///
            subtitle("Year 2000") ///
            note("Source:  U.S. Census Bureau, Census 2000, Tables 1, 2 and 3", ///
                  span)

