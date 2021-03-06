# Definindo o projeto de curso
# ----------------------------------------------
# Pergunta: O que afeta a qualidade do ar? Como?
# ----------------------------------------------

# install.packages("Ecdat") # se necess�rio
library (Ecdat) # carregando
data(Airq) # carregando o banco de dados
names(Airq) # exibe os nomes das vari�veis

# Descrevendo as vari�veis
# ----------------------------------------------
# airq: �ndice de qualidade do ar (quanto menor, melhor)
# vala: valor das empresas nas cidades (milhares de d�lares)
# rain: quantidade de chuva (em polegadas)
# coas: posi��o costeira da cidade (sim ou n�o)
# dens: densidade populacional (milha quadrada)
# medi: renda m�dia per capita (d�lares)


# An�lise descritiva ou explorat�ria
# ----------------------------------------------

summary(Airq) # sum�rio das vari�veis

# a vari�vel resposta � a qualidade do ar (airq)
# as vari�veis podem ser cont�nuas ou categ�ricas (divididas em categorias)
plot(airq~coas, data=Airq) # categ�rica
plot(airq~vala, data=Airq) # cont�nua

# Criando um modelo estat�stico
# y (resposta) ~ x (explicativa)
# ex: y (crescimento da planta) ~ x (quantidade de adubo)
# y ~x1 + x2 + x3
# airq ~ vala + coas + rain

# -------------------------------------------
# -------------------------------------------

# Montando modelo
m1 <- lm(airq~vala,data=Airq) # lm(modelo linear)
# alguns dados podem n�o ser lineares
m1
summary(m1) # para saber a signific�ncia do modelo
plot(airq~vala, data=Airq) # plot de regress�o linear

# p-valor indica a signific�ncia do modelo ou da vari�vel
# se p-valor for menor (<) 0.05 a vari�vel � significativa
# se o p-valor for maior (>) do que 0.05 n�o existe o efeito esperado

# A vari�vel "vala" n�o influenciou a qualidade do ar nas cidades ("airq")

# A vari�vel "coas" afeta a vari�vel "airq"
m2 <- lm(airq~coas, data=Airq)
summary(m2) # para saber a signific�ncia do modelo
# Sim! a posi��o costeira da cidade influ�ncia a qualidade do ar das cidades
# as cidades costeiras apresentam uma melhor qualidade do ar
plot(airq~coas, data=Airq) # plot de regress�o linear

# A vari�vel "medi" afeta a qualidade do ar?
m3<-lm(airq~medi,data=Airq)
summary(m3)
plot(airq~medi,data=Airq)
# a vari�vel n�o afetou a qualidade do ar

# A quantidade de chuva influencia a qualidade do ar?
m4<-lm(airq~rain,data=Airq)
summary(m4)
# a quantidade de chuva n�o afeta a qualidade do ar

# A densidade populacional 'dens' influencia a (qualidade do ar) 'airq'?
m5<-lm(airq~dens, data=Airq)
m5
summary(m5)
# NÃO, a vari�vel 'dens' n�o influencia 'airq' (p-value = 0.8).
plot(airq~dens, data=Airq)
curve(1.054e+02+-3.857e-04*x, add=TRUE)

# Retas de modelos n�o significativos s�o opcionais nos gr�ficos

# retas nos gr�ficos
plot(airq~medi,data=Airq)
# y=a+b*x
# a <- intercepto (onde a reta vai tocar no eixo y)
# b <- � a inclina��o da reta
summary(m3)
curve(9.936e+01+5.638e-04*x,add=TRUE)

# melhorando o gr�fico
plot(airq~medi,data=Airq, xlab="Renda m�dia per capita", ylab = "Qualidade do ar", pch=1,cex=1.2, col="blue", cex.lab=1.3, main="Renda m�dia - 2010")
?pch # tipos de pontos/marcadores
curve(9.936e+01+5.638e-04*x,add=TRUE,col="darkblue",lwd=2,lty=2)

# �nica vari�vel que explica a qualdiade do ar nas cidades � a posi��o costeira
plot(airq~coas, data=Airq, xlab="Posi��o costeira", ylab="Qualidade do ar", col="lightblue", ylim=c(50,170), cex.lab=1.3, main="Análise da qualidade do ar")

# -------------------------------------------
# termos: anova (vari�vel cont�nua ~ de uma vari�vel categ�rica)
# regress�o (vari�vel cont�nua ~ vari�vel cont�nua)
# regress�o m�ltipla (vari�vel cont�nua ~ vari�veis cont�nuas ou n�o)
# -------------------------------------------

# exerc�cio 5 (airq ~ vala)
summary(m1) # para saber a signific�ncia do modelo
plot(airq~vala, data=Airq, xlab="Valor das empresas ($1000)", ylab="Qualidade do ar", col="red", pch=8, cex.lab=1.2) # plot de regress�o linear
curve(96.451419+0.001969*x,add=TRUE,col="darkred",lwd=2,lty=3)

# regress�o m�ltipla
# ----------------------------------------------
mRM1 <-lm(airq~vala+coas, data=Airq)
summary(mRM1)
# Ent�o existe um efeito da posi��o costeira e do valor das empresas na qualidade do ar

# gr�fico regress�o m�ltipla
plot(airq~vala, data=Airq, xlab="Valor das empresas ($1000)", 
     ylab="Qualidade do ar")
curve(1.171e+02+1.999e-03*x,add=TRUE) #cidade n�o costeira
curve(1.171e+02+1.999e-03*x-2.968e+01,lty=2,add=TRUE) #cidade costeira
legend("bottomright",c("n�o-costeiras","Costeiras"),pch=1,lty=c(1,2),bty="n")

# A qualidade do ar das cidades � afetada tanto pelo valor das empresas quanto pela
# posi��o costeira das cidades. Quanto maior o valor das empresas, pior a qualidade
# do ar das cidades. Al�m disso, as cidades n�o-costeiras apresentam qualidade do 
# ar pior do que as cidades costeiras.

mRM2<-lm(airq~vala+coas+dens,data=Airq)
summary(mRM2)

# Contraste de modelos
# ----------------------------------------------
# comparar um modelo completo com um modelo sem a vari�vel em quest�o
modelocompleto<-lm(airq~vala+coas+dens,data=Airq)
modeloincompleto<-lm(airq~vala+coas,data=Airq)
# os modelos s�o iguais?
# se p>0.05 n�o existe diferen�a entre os modelos, ent�o eu continuo com 
# o modelo mais simples; se p<0.05 os mdelos s�o diferentes e a vari�vel n�o
# deve ser retirada do modelo
anova(modelocompleto,modeloincompleto)

# gr�fico final
# ----------------------------------------------
plot(airq~vala, data=Airq, xlab="Valor das empresas ($1000)", 
     ylab="Qualidade do ar", cex.lab=1.3,col="blue")
curve(1.171e+02+1.999e-03*x,add=TRUE,col="darkblue",lwd=1.4) #cidade n�o costeira
curve(1.171e+02+1.999e-03*x-2.968e+01,lty=2,add=TRUE,col="darkblue",lwd=1.4) #cidade costeira
legend("bottomright",c("n�o-costeiras","Costeiras"),pch=1,lty=c(1,2),bty="n",
       col=c("darkblue","darkblue"))

# Conclus�o
# ----------------------------------------------
# O que afeta a qualidade do ar nas cidades?
# As vari�veis que afetaram foram: (a) o valor das empresas e (b) a posi��o
# costeira das cidades. Quanto maior o valor das empresas, pior a qualidade do
# ar. Cidades costeiras apresentam uma melhor qualidade do ar.

