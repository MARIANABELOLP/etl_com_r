#Funções de repetição

View(LifeCycleSavings)

apply(LifeCycleSavings [ ,1:3], 2, mean) # calcula a média das três primeiras colunas; o núm 2 obriga que o resultado apareça em coluna. Caso queira que o formato seja em linhas, deve-se usar o núm 1.

lapply(LifeCycleSavings [ , -1], sqrt) #calcula a raiz quadrada, exceto da primeira coluna; essa função obrigatoriamente mantem a estrutura original do dado, que no caso é lista


sapply(LifeCycleSavings [ , -1], sqrt) #a diferença desse função para anterior, é que esta última sempre tenta simplificar o resultado; 

sapply(LifeCycleSavings [ , ], as.integer) #a função as.integer converte os resultados em números inteiros, simplesmente retira as casas decimais

sapply(LifeCycleSavings [ , ], round) #a função round converte os resultados em números inteiros arredondando o seu valor


