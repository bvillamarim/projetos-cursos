## Diretório:  
# conferir diretório
## Executar linha ou seleção: Ctrl + R

getwd()  # Trocar "\" por "/"
# mudar diretório
setwd()  # Trocar "\" por "/"

## Operações básicas: 
1+1
3*8+2/5
(3*7)
(3*7)/4

## Variáveis (nome_var <- valor_var): 
# Escalar:
numero <- (3*7)/4
numero*2
# Lista c():
lista <- c(1,2,3,4,5,6)
lista
lista *2
aulas <- c(2,4,4,6,6,6,6,8,8,10)

## Histograma:
hist(aulas)

## Ajuda (documentação da função)
?hist

## Medidas de tendência central:
numeros <- c(1,2,3,4,5)
numeros
# Média:
mean(numeros)
# Mediana:
median(numeros)

lista <- c(2,3,7,8,1,3,4,8,22,67,19)
# Média:
mean(lista)
# Mediana:
median(lista)

## Teste de normalidade Shapiro-Wilk
#H0: distribuição é normal
# Se p-value for próximo de 1, a distribuição é Normal:
shapiro.test(numeros)
# Se p-value < 0.05, distribuição NÃO é normal:
shapiro.test(lista)

## Resumo estatísticas descritivas:
summary(lista)
summary(numeros)

## Função para calcular moda:
mode <- function(x) {
     ux <- unique(x)
     ux[which.max(tabulate(match(x, ux)))]
}
lista2 <- c(1, 2, 2, 2, 2, 3, 3, 4, 5, 5, 6, 7)
mode(lista2)

## Boxplot
numeros <- c(1,3,5,6,10,19,23,5,7,89,15,14,22,23,32,23,37)
summary(numeros)
boxplot(numeros)
?boxplot
# Boxplot em .png (ordem: (1) preparar arquivo .png, (2) gerar boxplot, (3) enviar o buffer para o arquivo de imagem previamente configurado)
png(file="boxplot.png",width=700, height=700) #(1)
boxplot(numeros) #(2)
dev.off()  #(3)

## Desvio padrão, variância
# Variância
numeros <- c(1,2,3,5,6,7,8,11,2,3,44,55,67,12,34,56)
var(numeros)
# Desvio padrão
variancia <- var(numeros)
sqrt(variancia)
sd(numeros)

## Importar .csv
read.csv(file="numeros.csv")
nums <- read.csv(file="numeros.csv")
nums
nums$X1
nums$X2
hist(nums$X1)

## Intervalo de confiança
lizard <- c(6.2,6.6,7.1,7.4,7.6,7.9,8,8.3,8.4,8.5,8.6,8.8,8.8,9.1,9.2,9.4,9.4,9.7,9.9,10.2,10.4,10.8,11.3,11.9)
t.test(lizard)
t.test(lizard, conf.level=0.9)

## Personalizar histograma
media <- mean(lizard)
hist(lizard)
abline(v=media, col="blue", lwd=2)
abline(v=8.39, col="red", lwd=4)
abline(v=9.39, col="red", lwd=4)
t.test(lizard, conf.level=0.7)

## Teste de hipóteses
x1 <- runif(30, 37.9, 38.8)
x1
x2 <- runif(30, 36.0, 38.2)
x2
# Student t-test (quando a distribuição é normal) 
t.test(x1,x2)
?t.test # se dados pareados, adicionar "paired"
# Wilcoxon (quando a distribuição não é normal) 
wilcox.test(x1,x2)
?wilcox.test

## Correlação
nums <- read.csv(file="numeros.csv")
nums
cor(nums$X1,nums$X2)
a <- c(2,3,4)
b <- c(8,6,4)
cor(a,b)
cor(a,b, method="pearson") #default
cor(a,b, method="spearman")
b <- c(8,1,98)
cor(a,b)
c <- c(37,420,117)
d <- c(29,8,3)
cor(c,d)

## Regressão linear lm(y ~ x) # "~" significa "em função de" 
x1 <- c(1,2,3)
x2 <- c(2,4,6)
# x2 = f(x1)
lm (formula = x2 ~ x1)  # x2 = 0 + 2*x1
# x3 = f(x1)
x3 <- c(3,5,7)
lm(formula = x3 ~ x1)  # x3 = 1 + 2*x1
