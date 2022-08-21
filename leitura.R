#Formas de exportação

install.packages("microbenchmark")
library("microbenchmark")

#exportando em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")

#outra forma de exportação de dados em formato .csv
write.table(sinistrosRecifeRaw, file = "bases_tratadas/sinistrosRecife2.csv")


# compara os dois processos de exportação, usando a função microbenchmark

microbenchmark(a <- write.table(sinistrosRecifeRaw, file = "bases_tratadas/sinistrosRecife2.csv"), b <- write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv"), times = 10L)
