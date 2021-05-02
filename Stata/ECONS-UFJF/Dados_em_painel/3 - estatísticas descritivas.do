

cd "C:\Users\Bianca\Mestrado Economia Aplicada\Stata\Dados em painel\Bancos de dados"

use rais, clear

unique codmun, by(ano) 

xtset codmun ano

misstable summarize


xtsum renda

di ((r(sd_b)^2) + ( r(sd_w)^2)) ^0.5

tab ano, sum(total)




******************************************************************************************************

webuse nlswork, clear

xtset id year

xttab msp
xttab race

