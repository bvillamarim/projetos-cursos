

*************************  Escalar  *************************

scalar a = 2
scalar list a

scalar b = a + 3
scalar list b

scalar b = scalar(a) + 3
scalar list b


scalar a = scalar(a) + 1
scalar list a

scalar c = scalar(a) / b
scalar list c


***************************  Matriz  ***************************

**** Definir Matriz

mat A = 1,2
mat list A

mat A = 1\2
mat list A

mat B = ( 1, 2 \ 3 , 4)
mat list B


**** Operações com matriz

mat A = 1 , 2
mat B = 3 , 4

mat list A
mat list B

mat C = A \ B
mat list C

mat D = A , B
mat list D

mat E = A * C
mat list E

mat F = C * A'
mat list F

mat G = C * C
mat list G


mat G = (nullmat(G)\ 0 ,3)
mat list G


****** Funções de matriz

di colsof(D)
di rowsof(D)


mat H = (8 ,5 \ 4 ,6)
di det(H)

di trace(H)

mat list D
mat A = diag(D)
mat list A

mat A = invsym(A)
mat list A


********  Extrair elementos da matriz

scalar a = A[1,1]
scalar list a

mat B = A[1..2,1]
mat list B

mat B = A[1...,2]
mat list B

mat B = A[3,1..3]
mat list B



cd "C:\0 - IGOR\Softwares\STATA\Curso STATA\7 - Pos graduação 2018\2º Dia\Pnad\Bancos de dados"

use pnad_mod, clear


sum renda if sexo == 2
ret list

mat S = (r(N),r(mean))

sum renda if sexo == 4

mat S = (nullmat(S)\(r(N),r(mean)))

mat list S






*************************************************************************
******************          Macros        *******************************


local a = 1
di `a'

local a = "Oi"
di "`a'"

local a = 1
local a = `a' + 1
di `a'

local t = "Pos Graduação em Economia"
di "`t'"
tokenize `t'

di "`1'"


di in red "`2'"
di in green "`3'"
di in white "`4'"



