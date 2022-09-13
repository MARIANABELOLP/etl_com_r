#Simulações e repetições. O R vem com diversas funções para simular distribuições estatísticas. A primeira letra da função, que pode ser r, d, p ou q, indica, respectivamente, se a função é: (i) geradora de variáveis aleatórias; (ii) de densidade; (iii) de distribuição acumulada; ou, (iv) de quantil.
#Para que os resultados obtidos possam ser reproduzidas em qualquer computador, usa-se a função set.seed
#Já a função addTaskCallback registra uma função R que deve ser chamada sempre que uma tarefa de nível superior for concluída.
tarefaSemente <- addTaskCallback(function(...){set.seed(123);TRUE})
tarefaSemente

#distribuição normal simulada. O número 100 indica o total de casos. Como foi utilizada a função set.seed, os resultados obtidos são os mesmos em qualquer pc.
distNormalSimulacao <- rnorm(100)
summary(distNormalSimulacao)

#Distribuição binominal simulada. O número 100 indica a amostra. Em seguida tem o número de repetições do experimento (no exemplo, optou-se por simular uma variável binária 0 ou 1) e, por último, a probabilidade de sucesso de cada teste
distBinominalSimulacao <-rbinom(100, 1, 0.7)
distBinominalSimulacao

#Repetições
classeSimulacao <- c(rep("Jovem", length(distBinominalSimulacao)/2), rep("Jovem Adulto", length(distBinominalSimulacao)/2)) #metade dos dados com jovem e a outra parte com jovem adultos

classeSimulacao2 <- c(rep("Jovem", length(distBinominalSimulacao)/3))#repetindo a palavra jovem no primeiro terço da distribuição


#Sequências, iniciando em 1 até o tamanho da distribuição
indexSimulacao <- seq(1, length(distNormalSimulacao)) 

#Outros exemplos
variavelNormal <- rnorm(10)
variavelBinomial <- rbinom(10, 4, 0.8)
variavelIndex <- seq(1, length(variavelNormal))
variavelIndexB <- seq(3, length(variavelBinomial))#iniciando em 3 até o tamanho da distribuição
variavelIndexB2 <- seq(3, 5)#iniciando em 3 até a posição 5

# a função removeTaskCallback remove a tarefa criada no início
removeTaskCallback(tarefaSemente)
