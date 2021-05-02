/*

*********   Mapas para todo o território brasileiro

ftp://geoftp.ibge.gov.br/organizacao_do_territorio/malhas_territoriais/malhas_municipais/municipio_2017/Brasil/BR/


*********   Mapas para cada estado

ftp://geoftp.ibge.gov.br/organizacao_do_territorio/malhas_territoriais/malhas_municipais/municipio_2017/UFs/


********* Mapas para divisões intramunicipais

ftp://geoftp.ibge.gov.br/organizacao_do_territorio/malhas_territoriais/malhas_de_setores_censitarios__divisoes_intramunicipais/


*/


cd "C:\Nova pasta\Curso Graduação 2018\1ª aula\2ª parte - Dados Espaciais"


cd "2 - Dados Espaciais"

************************     Municípios       **********************************
clear

spshape2dta BRMUE250GC_SIR, saving(mun) replace

use mun, clear

spset
********************************************************************************

****************************     Estados     ***********************************

clear


spshape2dta BRUFE250GC_SIR, saving(uf) replace


use uf

spset

gen n = _n

grmap, activate
grmap n

********************************************************************************

****************************     Mesorregiões      *****************************

*clear

*spshape2dta BRMEE250GC_SIR, saving(meso) replace


*use meso

*spset


********************************************************************************

****************************     Microrregiões       ***************************

*clear

*spshape2dta BRMIE250GC_SIR, saving(micro) replace


*use micro

*spset

********************************************************************************



use uf, clear

mergepoly using uf_shp.dta, by(NM_REGIAO) coor(regiao_shp.dta) replace

spset _ID

spset , shpfile(regiao_shp.dta) modify
save regiao, replace


gen teste= _n

grmap teste





********************************************************************************

use uf, clear


keep if NM_REGIAO == "SUDESTE"

save sudeste, replace

spcompress


 gen teste = _n
 
 grmap teste
********************************************************************************


use "aula1_mod.dta", clear


collapse (mean) renda educ idade draca1 draca2 draca3 (sum) rendatot = renda [w=peso], by(uf)


gen CD_GEOCUF = ""
replace CD_GEOCUF = "11" if uf == "RO"
replace CD_GEOCUF = "12" if uf == "AC"
replace CD_GEOCUF = "13" if uf == "AM"
replace CD_GEOCUF = "14" if uf == "RR"
replace CD_GEOCUF = "15" if uf == "PA"
replace CD_GEOCUF = "16" if uf == "AP"
replace CD_GEOCUF = "17" if uf == "TO"
replace CD_GEOCUF = "21" if uf == "MA"
replace CD_GEOCUF = "22" if uf == "PI"
replace CD_GEOCUF = "23" if uf == "CE"
replace CD_GEOCUF = "24" if uf == "RN"
replace CD_GEOCUF = "25" if uf == "PB"
replace CD_GEOCUF = "26" if uf == "PE"
replace CD_GEOCUF = "27" if uf == "AL"
replace CD_GEOCUF = "28" if uf == "SE"
replace CD_GEOCUF = "29" if uf == "BA"
replace CD_GEOCUF = "31" if uf == "MG"
replace CD_GEOCUF = "32" if uf == "ES"
replace CD_GEOCUF = "33" if uf == "RJ"
replace CD_GEOCUF = "35" if uf == "SP"
replace CD_GEOCUF = "41" if uf == "PR"
replace CD_GEOCUF = "42" if uf == "SC"
replace CD_GEOCUF = "43" if uf == "RS"
replace CD_GEOCUF = "50" if uf == "MS"
replace CD_GEOCUF = "51" if uf == "MT"
replace CD_GEOCUF = "52" if uf == "GO"
replace CD_GEOCUF = "53" if uf == "DF"


merge 1:1 CD_GEOCUF using uf



save banco_espacial, replace

spset



********************************************************************************
********************************************************************************


 use banco_espacial, clear
 
 grmap, activate
 
 
grmap renda

 
format renda %8,2fc

grmap

grmap renda, legstyle(2)

graph export "uf.png", as(png) replace


grmap renda if NM_REGIAO == "NORDESTE"



**************************************************************************************************************



**** Alterar as cores do mapa: opção fcolor


/*
				NAME	MAXCOL	TYPE	SOURCE
								
				Blues	9	Sequential	Brewer
				Blues2	99	Sequential	Custom
				BuGn	9	Sequential	Brewer
				BuPu	9	Sequential	Brewer
				GnBu	9	Sequential	Brewer
				Greens	9	Sequential	Brewer
				Greens2	99	Sequential	Custom
				Greys	9	Sequential	Brewer
				Greys2	99	Sequential	Brewer
				Heat	16	Sequential	Custom
				OrRd	9	Sequential	Brewer
				Oranges	9	Sequential	Brewer
				PuBu	9	Sequential	Brewer
				PuBuGn	9	Sequential	Brewer
				PuRd	9	Sequential	Brewer
				Purples	9	Sequential	Brewer
				Rainbow	99	Sequential	Custom
				RdPu	9	Sequential	Brewer
				Reds	9	Sequential	Brewer
				Reds2	99	Sequential	Custom
				Terrain	16	Sequential	Custom
				Topological	16	Sequential	Custom
				YlGn	9	Sequential	Brewer
				YlGnBu	9	Sequential	Brewer
				YlOrBr	9	Sequential	Brewer
				YlOrRd	9	Sequential	Brewer
				BrBG	11	Diverging	Brewer
				BuRd	11	Diverging	Custom
				BuYlRd	11	Diverging	Custom
				PRGn	11	Diverging	Brewer
				PiYG	11	Diverging	Brewer
				PuOr	11	Diverging	Brewer
				RdBu	11	Diverging	Brewer
				RdGy	11	Diverging	Brewer
				RdYlBu	11	Diverging	Brewer
				RdYlGn	11	Diverging	Brewer
				Spectral	11	Diverging	Brewer
				Accent	8	Qualitative	Brewer
				Dark2	8	Qualitative	Brewer
				Paired	12	Qualitative	Brewer
				Pastel1	9	Qualitative	Brewer
				Pastel2	8	Qualitative	Brewer
				Set1	9	Qualitative	Brewer
				Set2	8	Qualitative	Brewer
				Set3	12	Qualitative	Brewer


*/



grmap renda, fcolor(RdBu) legstyle(2)




/*

** Métodos: quantile (default), boxplot, eqint, stdev, kmeans, custom, unique

clmethod(     )

** Número de classes: default 4

clnumber( )





*/


grmap renda, fcolor(Greens) clnumber(6) legstyle(2)




*****************

grmap renda, fcolor(Greens) ocolor(Greens) osize(vvthin)  ///
		title("Brasil", size(*0.6))  subtitle("Renda por Estados", size(*0.8))  ///
        legstyle(2)    legtitle(Renda)   legend(region(lcolor(green))) legcount 
		
		

grmap renda, fcolor(Blues) ocolor(Blues) osize(vvthin)  ///
		title("Brasil", size(*0.6))  subtitle("Renda por Estados", size(*0.8))  ///
        legstyle(2)    legtitle(Renda)   legend(region(lcolor(green))) legcount 
		
	
*****************************
cd "C:\Nova pasta\2ª parte - Dados Espaciais\2 - Dados Espaciais"

 use pnad_espacial, clear



 grmap,                        ///
         title("População por Estado", size(*0.8))             ///
         subtitle("Brasil, 2010" " ", size(*0.8))              ///
         point(data("pnad_espacial") xcoord(_CX)    ///
         ycoord(_CY) proportional(pop) fcolor(red)          ///
         ocolor(white) size(*1.4))                             ///
         label(data("pnad_espacial") xcoord(_CX)    ///
         ycoord(_CY) label(pop) color(white) size(*0.45))

		 
		 
		 
gen desocup = pop - trabalhador

grmap, fcolor(stone)   ///
         diagram(variable(trabalhador desocup) proportional(pop) size(2.3)    ///
         xcoord(_CX) ycoord(_CY) legenda(on))                       ///
         legend(title("População", size(*0.5) bexpand         ///
         justification(left)))                                            ///
         note(" " "NOTA: Tamanho dos gráficos proporcional ao número de habitantes total", ///
         size(*0.75))










/*
Criar base de coordenadas apenas para uma área específica. Exemplo: criar base
apenas com os estados do sudeste

Abrir a base .......................


*/


grmap renda,                               ///
         clnumber(4) fcolor(Greens2) ocolor(white ..) osize(thin ..)     ///
         title("Renda por Estado", size(*0.8))                        ///
         subtitle("Brasil, 2000" " ", size(*0.8))                         ///
         legstyle(3) legend(ring(1) position(3))                         ///
         plotregion(icolor(stone)) graphregion(icolor(stone))             ///
         polygon(data("regiao_shp") ocolor(red) osize(thin))

 
	 
		 

		 
grmap renda if NM_REGIAO=="SUDESTE",                ///
         fcolor(Blues2) ocolor(white ..) osize(thin ..)         ///
         title("Renda por Estado", size(*0.8)) legstyle(2)                          ///
         subtitle("Sudeste do Brasil, 2010" " ", size(*0.8))               ///
		 polygon(data("uf_shp") fcolor(gs12)                        ///
         ocolor(white) osize(thin)) polyfirst		 
	
	
	

	