******************************************************************************************************
*********** 	ELABORADO PELO ECONS COMO PARTE DA APOSTILA DE INTRODUÇÃO AO STATA       *************
**************************                  COLLPASE          ****************************************
******************************************************************************************************

**** Definir diretório de trabalho
cd "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\"

**** Carregar o banco1
use "Bancos de dados\aula1_mod.dta", clear
/*
***********************************************************************************************************************************************************
**********************************************                     Agregar os dados            ************************************************************
***********************************************************************************************************************************************************


 Transformar o banco de dados em um banco de dados agregado por Unidades da
 Federação contendo as seguintes informações: 
 
- Renda média do trabalho
- Renda média das mulheres
- Renda média dos homens
- Renda média dos adultos
- Idade média
- Percentual por raça
- Total por raça
- Total da população
 
  
Criar variável com renda só dos homens (missing para mulheres) e outra com renda só das mulheres (missing para homens)
*/
separate renda, by(genero)
 
** Criar variável com renda só da população adulta (missing nos outros casos)

gen renda_adulto = renda if idade >= 18
 
 gen um = 1
 
collapse (mean) renda renda1 renda2 renda_adulto idade  draca1 draca2 draca3 ///
	(sum) total_branco=draca1 total_negro=draca2 total_pardo=draca3 (count) pop=um, by(uf)

	
	
	
	

/***
Com o intuito de deixar bem claro o funcionamento do comando, vamos explicar como foi calculada cada informação solicitada.

i) Para calcular e renda média do trabalho, a renda per capita média, a idade média, o percentual de adultos e o percentual da população por raça, 
basta utilizar a opção mean e logo após especificar as variáveis. Lembre-se que a média de uma variável dummy calcula o percentual da categoria de
 referência (esta correspondência foi utilizada para calcular os percentuais de adulto e de raça);
 
ii) Para calcular o total de pessoas por raça, utiliza-se a opção sum e logo após especifica-se as variáveis de raça. Como estas variáveis já foram
 utilizadas para calcular os percentuais, é preciso atribuir outros nomes para representar os totais. Isto é feito colocando-se o nome da variável 
 nova e o sinal de igual antes da variável de indicadora de raça;
 
iii) Por fim, para calcular o total da população por Estado, utiliza-se a opção count e logo após especifica-se uma variável que se sabe possui 
informação para toda a população. Em outras palavras, utiliza-se uma variável com nenhuma informação igual a missing. Do mesmo modo que ocorreu 
para calcular o total por raça, vamos criar um novo nome para esta variável. Vamos chamá-la de pop.


Automaticamente, o comando cria um label para as variáveis, contendo a informação de qual função foi utilizada no comando collapse e qual variável foi utilizada
No entanto, nem sempre esse label é claro o suficiente, quando isso ocorrer recomenda-se refazer o label.


***/

