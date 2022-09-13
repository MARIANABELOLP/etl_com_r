#Amostragem e boostrapping
#Amostragem SEM reposição usando função sample. O número 15 é o tamanho da amostra.
amostraSEMrepeticao <- sample(distNormalSimulacao, 15, replace = FALSE)

#Amostragem COM reposição usando função sample
amostraCOMrepeticao <- sample(distNormalSimulacao, 15, replace = TRUE)

#Bootstrapping com função replicate. Com bootstrapping é bom que seja sempre ocm reposição.
set.seed(412)

bootsDistNorma110 <- replicate (10, sample(distNormalSimulacao, 15, replace = TRUE)) # replicamos 10x a amostra, criando assim um bootstrapping
bootsDistNorma110

TbootsDistNormal10 <- replicate(10, amostraCOMrepeticao) # O resultado foi diferente. Não entendi.
TbootsDistNormal10


#Calculando uma estatística com bootstrapping - 10, 50 e 100 amostras COM repetição
mediaBootsNormal10 <- replicate(10,  mean(sample(distNormalSimulacao, 10, replace = TRUE)))  # calculamos a média de 10 amostras de 10 casos
mediaBootsNormal50 <- replicate(50,  mean(sample(distNormalSimulacao, 10, replace = TRUE)))  # calculamos a média de 50 amostras de 10 casos
mediaBootsNormal100 <- replicate(100,  mean(sample(distNormalSimulacao, 10, replace = TRUE)))  # calculamos a média de 100 amostras de 10 casos

#vamos comparar
mean(mediaBootsNormal10) # media do boostraping 10
mean(mediaBootsNormal50) # media do boostraping 50
mean(mediaBootsNormal100) # media do boostraping 100 # O resultado deu 0.03715181?
mean(distNormalSimulacao) # media dos dados originais

#Partições
library(caret)
#criando a partição de dados
particaoDistNormal<- createDataPartition(1:length(distNormalSimulacao), p=.7)# a primeira informação entre parêntese é o tamanho do vetor, que nesse caso é de 1 ao tamanho da disNormalSimulacao. E o P é a probabilidade(parâmetro) de partição(divisão) que será de 70/30. Se fosse 80/20 colocaria .8
treinoDistNormal <- distNormalSimulacao[unlist(particaoDistNormal)]
testeDistNormal<-distNormalSimulacao[- unlist(particaoDistNormal)]
