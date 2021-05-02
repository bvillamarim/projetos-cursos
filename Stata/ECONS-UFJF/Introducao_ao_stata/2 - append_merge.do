****************************************************************************************************************************************************
*****************                 APOSTILA DO MINICURSO MICRODADOS COM O USO DO STATA                   ********************************************
************************                ECONS - FACULDADE DE ECONOMIA UFJF                              ********************************************
****************************************************************************************************************************************************


** Definir Diretório de Trabalho
cd "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\Bancos de dados"


**********************************************************************************************************************************************8
***********************                        SEÇÃO 7 - COMBINAR DIVERSOS BANCOS DE DADOS                               ********************* 

use "banco3.dta", clear

append using "banco2.dta"

sort id
* Neste exemplo, vamos unir dois bancos de dados novamente, mas agora com um dos bancos 
*contendo três variáveis a menos. Para visualizar este procedimento, impute o banco de dados conforme 
*programação  abaixo e depois realize o append com o banco de dados “banco2”. 

use "banco4.dta", clear

append using "banco2.dta"



* Para ilustrar o comando merge na opção one-to-one vamos imputar o banco de dados abaixo e
 *realizar o merge com o banco de dados “banco2”. 
* Neste caso faremos um merge com correspondência um para *um,  cuja variável de ligação é a id (identificadora do indivíduo):

use "banco5.dta", clear

merge 1:1 id using  "banco2.dta"

* Neste exemplo iremos acrescentar variáveis referentes a Estados ao “banco2” que tem as 
* informações individuais.
* Neste caso a variável de ligação será a var1, que contém a sigla do Estado.
* Este vai ser um caso de várias observações de uma variável de ligação para uma. Vamos imputar o banco de 
* dados abaixo e depois fazer o merge com o “banco2”. 
* Como o banco de dados de Estado que estará aberto no Stata, a opção one-to-many será utilizada.

use "banco6.dta", clear

merge 1:m  var1 using  "banco2.dta"





