cd "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\Dados Espaciais"


clear

tempfile uf 

copy "ftp://geoftp.ibge.gov.br/organizacao_do_territorio/malhas_territoriais/malhas_municipais/municipio_2017/Brasil/BR/br_unidades_da_federacao.zip" `uf'

unzipfile `uf', replace



clear


spshape2dta BRUFE250GC_SIR, saving(uf) replace


use uf, clear

mergepoly using uf_shp.dta, by(NM_REGIAO) coor(regiao_shp.dta) replace

spset _ID

spset , shpfile(regiao_shp.dta) modify
save regiao, replace


gen teste= _n

grmap teste



use uf, clear


gen teste= _n

grmap teste if NM_REGIAO == "SUL"




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




grmap renda


grmap renda if NM_REGIAO == "SUL", clnumber(2)




 
	 