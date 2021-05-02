# Definindo o projeto de curso
# ----------------------------------------------
# Pergunta: O que afeta a qualidade do ar? Como?
# ----------------------------------------------

# install.packages("Ecdat") # se necessário
library (Ecdat) # carregando
data(Airq) # carregando o banco de dados
names(Airq) # exibe os nomes das variáveis

# Descrevendo as variáveis
# ----------------------------------------------
# airq: Índice de qualidade do ar (quanto menor, melhor)
# vala: valor das empresas nas cidades (milhares de dólares)
# rain: quantidade de chuva (em polegadas)
# coas: posição costeira da cidade (sim ou não)
# dens: densidade populacional (milha quadrada)
# medi: renda média per capita (dólares)


# Análise descritiva ou exploratória
# ----------------------------------------------

summary(Airq) # sumário das variáveis

# a variável resposta é a qualidade do ar (airq)
# as variáveis podem ser contínuas ou categóricas (divididas em categorias)
plot(airq~coas, data=Airq) # categórica
plot(airq~vala, data=Airq) # contínua

# Criando um modelo estatístico
# y (resposta) ~ x (explicativa)
# ex: y (crescimento da planta) ~ x (quantidade de adubo)
# y ~x1 + x2 + x3
# airq ~ vala + coas + rain

# -------------------------------------------
# -------------------------------------------

# Montando modelo
m1 <- lm(airq~vala,data=Airq) # lm(modelo linear)
# alguns dados podem não ser lineares
m1
summary(m1) # para saber a significância do modelo
plot(airq~vala, data=Airq) # plot de regressão linear

# p-valor indica a significância do modelo ou da variável
# se p-valor for menor (<) 0.05 a variável é significativa
# se o p-valor for maior (>) do que 0.05 não existe o efeito esperado

# A variável "vala" não influenciou a qualidade do ar nas cidades ("airq")

# A variável "coas" afeta a variável "airq"
m2 <- lm(airq~coas, data=Airq)
summary(m2) # para saber a significância do modelo
# Sim! a posição costeira da cidade influência a qualidade do ar das cidades
# as cidades costeiras apresentam uma melhor qualidade do ar
plot(airq~coas, data=Airq) # plot de regressão linear

# A variável "medi" afeta a qualidade do ar?
m3<-lm(airq~medi,data=Airq)
summary(m3)
plot(airq~medi,data=Airq)
# a variável não afetou a qualidade do ar

# A quantidade de chuva influencia a qualidade do ar?
m4<-lm(airq~rain,data=Airq)
summary(m4)
# a quantidade de chuva não afeta a qualidade do ar

# A densidade populacional 'dens' influencia a (qualidade do ar) 'airq'?
m5<-lm(airq~dens, data=Airq)
m5
summary(m5)
# NÃƒO, a variável 'dens' não influencia 'airq' (p-value = 0.8).
plot(airq~dens, data=Airq)
curve(1.054e+02+-3.857e-04*x, add=TRUE)

# Retas de modelos não significativos são opcionais nos gráficos

# retas nos gráficos
plot(airq~medi,data=Airq)
# y=a+b*x
# a <- intercepto (onde a reta vai tocar no eixo y)
# b <- é a inclinação da reta
summary(m3)
curve(9.936e+01+5.638e-04*x,add=TRUE)

# melhorando o gráfico
plot(airq~medi,data=Airq, xlab="Renda média per capita", ylab = "Qualidade do ar", pch=1,cex=1.2, col="blue", cex.lab=1.3, main="Renda média - 2010")
?pch # tipos de pontos/marcadores
curve(9.936e+01+5.638e-04*x,add=TRUE,col="darkblue",lwd=2,lty=2)

# única variável que explica a qualdiade do ar nas cidades é a posição costeira
plot(airq~coas, data=Airq, xlab="Posição costeira", ylab="Qualidade do ar", col="lightblue", ylim=c(50,170), cex.lab=1.3, main="AnÃ¡lise da qualidade do ar")

# -------------------------------------------
# termos: anova (variável contínua ~ de uma variável categórica)
# regressão (variável contínua ~ variável contínua)
# regressão múltipla (variável contínua ~ variáveis contínuas ou não)
# -------------------------------------------

# exercício 5 (airq ~ vala)
summary(m1) # para saber a significância do modelo
plot(airq~vala, data=Airq, xlab="Valor das empresas ($1000)", ylab="Qualidade do ar", col="red", pch=8, cex.lab=1.2) # plot de regressão linear
curve(96.451419+0.001969*x,add=TRUE,col="darkred",lwd=2,lty=3)

# regressão múltipla
# ----------------------------------------------
mRM1 <-lm(airq~vala+coas, data=Airq)
summary(mRM1)
# Então existe um efeito da posição costeira e do valor das empresas na qualidade do ar

# gráfico regressão múltipla
plot(airq~vala, data=Airq, xlab="Valor das empresas ($1000)", 
     ylab="Qualidade do ar")
curve(1.171e+02+1.999e-03*x,add=TRUE) #cidade não costeira
curve(1.171e+02+1.999e-03*x-2.968e+01,lty=2,add=TRUE) #cidade costeira
legend("bottomright",c("não-costeiras","Costeiras"),pch=1,lty=c(1,2),bty="n")

# A qualidade do ar das cidades é afetada tanto pelo valor das empresas quanto pela
# posição costeira das cidades. Quanto maior o valor das empresas, pior a qualidade
# do ar das cidades. Além disso, as cidades não-costeiras apresentam qualidade do 
# ar pior do que as cidades costeiras.

mRM2<-lm(airq~vala+coas+dens,data=Airq)
summary(mRM2)

# Contraste de modelos
# ----------------------------------------------
# comparar um modelo completo com um modelo sem a variável em questão
modelocompleto<-lm(airq~vala+coas+dens,data=Airq)
modeloincompleto<-lm(airq~vala+coas,data=Airq)
# os modelos são iguais?
# se p>0.05 não existe diferença entre os modelos, então eu continuo com 
# o modelo mais simples; se p<0.05 os mdelos são diferentes e a variável não
# deve ser retirada do modelo
anova(modelocompleto,modeloincompleto)

# gráfico final
# ----------------------------------------------
plot(airq~vala, data=Airq, xlab="Valor das empresas ($1000)", 
     ylab="Qualidade do ar", cex.lab=1.3,col="blue")
curve(1.171e+02+1.999e-03*x,add=TRUE,col="darkblue",lwd=1.4) #cidade não costeira
curve(1.171e+02+1.999e-03*x-2.968e+01,lty=2,add=TRUE,col="darkblue",lwd=1.4) #cidade costeira
legend("bottomright",c("não-costeiras","Costeiras"),pch=1,lty=c(1,2),bty="n",
       col=c("darkblue","darkblue"))

# Conclusão
# ----------------------------------------------
# O que afeta a qualidade do ar nas cidades?
# As variáveis que afetaram foram: (a) o valor das empresas e (b) a posição
# costeira das cidades. Quanto maior o valor das empresas, pior a qualidade do
# ar. Cidades costeiras apresentam uma melhor qualidade do ar.

