#Calculando com o R

#Destalhes sobre a base de dados nativa do R - cars
?cars

View(cars)

#Transformar as medidas da base de dados car para km/h
Velocidade <- cars$speed * 1.60934
Distância <- cars$dist * 0.0003048

carsNovo <- data.frame(
  Velocidade = Velocidade ,
  Distância = Distância
  )

View(carsNovo)

#Histograma da velocidade nova

A <- hist(carsNovo$Velocidade)
B <- hist(Velocidade)
A == B # QUAL O MOTIVO DO ERRO?

#Média da velocidade nova
mean(Velocidade)

#Centralização da velocidade nova

velocidadeSimulacaoCentral <- Velocidade - mean(Velocidade)
hist(velocidadeSimulacaoCentral)
