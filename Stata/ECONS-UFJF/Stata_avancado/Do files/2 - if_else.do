

**********************************

local a = 1

if `a' == 1{
	local texto = "Macro local a = 1"
}
di "`texto'"


local a = 2

if `a' == 1{
	local texto = "Macro local a = 1"
}
di "`texto'"


************************************

local a = 1

if `a' == 1{
	local texto = "OK"
}
else{
	local texto = "Diferente de um"
}

di "`texto'"



local a = 2

if "`a'" == "oi"{
	local texto = "OK"
}
else{
	local texto = "Diferente de oi"
}

di "`texto'"


********************************************


local a = 3

if `a' == 1{
	local texto = "Macro local a = 1"
}
else if `a' == 2{
	local texto = "Macro local a = 2"
}
else{
	local texto = "Diferente de um e de dois"
}


di "`texto'"



