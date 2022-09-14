#Correlação
pacman::p_load(corrplot, dplyr, ggplot2)

data()
View(trees)
str(trees)

#Tabela de correlação com todas as variáveis
cor(trees)

#Gráficos de dispersão pareados das variáveis
pairs(trees)

#Corrplot das variáveis
treesCor <- cor(trees)
corrplot(treesCor, method = "number", order='alphabet')
corrplot(treesCor, order = 'alphabet')


