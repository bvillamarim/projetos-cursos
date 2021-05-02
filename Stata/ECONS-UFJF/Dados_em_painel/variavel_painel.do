


egen id = group(pis)

bys pis (ano): gen teste1 = tp_empr  - tp_empr[_n-1] if _n > 1
replace teste1= tp_empr if teste1 <0 | teste1 ==.
bys pis (ano): replace teste1 = teste1  + teste1[_n-1] if _n > 1
