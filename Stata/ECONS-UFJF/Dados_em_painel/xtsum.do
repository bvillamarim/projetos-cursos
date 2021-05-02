webuse reshape1, clear
reshape long inc ue, i(id) j(year)

****M�dia individual
by id, sort: egen mean = mean(inc)

egen tag = tag(mean)
gen mean_01 = mean if tag == 1

***** M�dia geral
egen overall_mean = mean(inc)


*** Varia��o between

gen desvio = ( mean_01- overall_mean)^2

egen total_b =total(desvio)

gen b = sqrt(total_b/2)

di  sqrt((7166667/2))



**** Varia��o within
gen desvio_within = (inc- mean)
gen desvio_w2 = desvio_within^2
egen total = total(desvio_w2)
replace total = total/8
gen w = sqrt(total)


xtset id year
xtsum inc
