#Escolhendo uma base de dados
data()
?ChickWeight
View(ChickWeight)

#Modos diferentes de solicitar apenas os dados de uma coluna específica
ChickWeight$weight
ChickWeight[ ,"weight"]
ChickWeight[ ,"weight", drop = FALSE] #apresenta o mesmo resultado dos anteriores, mudando apenas o formato da apresentação (deixa de ser em sequência/vetor para mostrar em formato coluna)

#Criando uma nova base de dados com base na Chickweight, porém com apenas 10 linhas

novaChickWeight <- ChickWeight[1:10, ]
View(novaChickWeight)

#Separando apenas os dados do Weight em vetor 
novaChickWeight$weight
novaChickWeight[ , "weight"]
Pesos <- novaChickWeight[ , "weight"]
Pesos
Pesos[2]
Pesos[7:10]
Pesos >60
Pesos >60 & Pesos <150
which(Pesos >60 & Pesos <150)
match(Pesos,  42)
match(Pesos, Pesos >60 & Pesos <150) # NÃO RETORNOU NENHUMA CORRESPONDÊNCIA - NÃO ENTENDI