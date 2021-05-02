## Diretório:  
# conferir diretório
## Executar linha ou seleção: Ctrl + R

getwd()  # Trocar "\" por "/"
# mudar diretório
setwd()  # Trocar "\" por "/"

## Dados
x1 <- runif(30, 37.9, 38.8)
x2 <- runif(30, 36.0, 38.2)

## Teste T: 
t.test(x1, x2)

## Teste de Wilcoxon
wilcox.test(x1, x2)

# Importar dados do csv
nums <- read.csv(file="numeros.csv")
nums

## Correlação
cor(nums$X1, nums$X2)

a <- c(2, 3, 4)
b <- c(8, 6, 4)
cor (a, b)
cor(a, b, method="pearson")
cor(a, b, method="spearman")

## Regressão simples
x1 <- c(1, 2, 3)
x2 <- c(2, 4, 6)
lm(formula = x2 ~ x1)

x3 <- c(3, 5, 7)
lm(formula = x3 ~ x1)
