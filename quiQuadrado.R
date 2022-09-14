#QUI-QUADRADO - VARIÁVEIS CATEGÓRICAS
#Carregando os pacotes
pacman::p_load(data.table, ggplot2)

breast_cancer <- fread('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/breast_cancer.csv', stringsAsFactors = T)
View(breast_cancer)

#Tabela de contigência (frequência de casos de maneira cruzada )
breast_cancer_table <- table(breast_cancer$breast, breast_cancer$idade)
breast_cancer_table

#Gráficos de dispersão pareados das variáveis (forma gráfica da tabela de contigência)
ggplot(breast_cancer) + aes (x = idade, fill = breast) + geom_bar(position = "fill")

#Teste qui-quadrado
breast_cancer_test <- chisq.test(breast_cancer_table)
breast_cancer_test
breast_cancer_test$observed #mesmo resultado da tabela de contigência
breast_cancer_test$expected

#Corrplot das variáveis
corrplot(breast_cancer_test$residuals, is.cor = FALSE)
