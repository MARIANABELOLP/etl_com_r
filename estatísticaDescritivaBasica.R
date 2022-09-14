#Estatística descritiva
View(USArrests)
#Tabela de frequência absoluta da variável Murder - a frequência absoluta é a frequência em que um determinado dado se repetiu.
table(USArrests$Murder)


# Tabela de frequência relativa da variável Murder - divisão entre a frequência absoluta e o total de respostas obtidas, então a frequência relativa mostra qual é a porcentagem que aquele determinado dado representa em relação ao todo.
prop.table(table(USArrests$Murder))

#Média da variável Murder
mean(USArrests$Murder)

#Mediana da variável Murder
median(USArrests$Murder)

#Separatrizes da variável Murder
quantile(USArrests$Murder, probs = 0.75) #quer saber qual valor da variável que fica com 75% dos dados abaixo e 25% acima
quantile(USArrests$Murder, probs = 0.10)
quantile(USArrests$Murder, probs = 0.95)
boxplot(USArrests$Murder) #boxplot - gráfico que resume as separatrizes

#Desvio padrão da variável Murder
sd(USArrests$Murder)
plot(USArrests$Murder)

#Sumário descritivo básico das variáveis
summary(USArrests)


#Sumário descritivo completo das variáveis usando o pacote fBasics
pacman::p_load(fBasics)
basicStats(USArrests[ , c(1:4)])
hist(USArrests$Murder) # histograma: gráfico que permite conhecer a curva dos dados
