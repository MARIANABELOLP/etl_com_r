#Atividade ETL - Extração, tratamento e leitura

#Carregando a base de dados DE 2019, 2020 E 2021 de sinistros de trânsito diretamente do site da PCR (obs: raw = bruto)

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

#Juntando a base de dados com o comando rbind (juntas por linhas) - ou seja, colocar uma base de dados debaixo da outra 
sinistrosRecifeRaw <- rbind(sinistrosRecife2019Raw, sinistrosRecife2020Raw, sinistrosRecife2021Raw)

#Apareceu um erro no código, infomando que o número de colunas não correspondiam
View(sinistrosRecife2019Raw) #41 colunas - colunas 10, 11, 12 e 14 são diferentes
View(sinistrosRecife2020Raw) #38 colunas - coluna de descrição (número 14) não aparece na base do ano de 2021
View(sinistrosRecife2021Raw) #37 colunas

#Ajustando a base 2019 e 2020
sinistrosRecife2019Raw <- sinistrosRecife2019Raw[c(1:9, 13:16, 18:41)]
sinistrosRecife2020Raw <- sinistrosRecife2020Raw[ , -14]

View(sinistrosRecife2019Raw)
#Juntando a base de dados com o comando rbind (juntas por linhas)
sinistrosRecifeRaw <- rbind(sinistrosRecife2019Raw, sinistrosRecife2020Raw, sinistrosRecife2021Raw)

#Apareceu um erro no código, infomando que os nomes não correspondiam. Para comparar usei o VIEW e o STR
str(sinistrosRecife2019Raw) #A coluna data está com letras maiúsculas 
str(sinistrosRecife2020Raw)
str(sinistrosRecife2021Raw)


#Mudando o nome de uma coluna
sinistrosRecife2019Raw <- rename (sinistrosRecife2019Raw, data = DATA) #primeiro coloca o nome novo e após o igual coloca o nome antigo

#Juntando a base de dados com o comando rbind (juntas por linhas)
sinistrosRecifeRaw <- rbind(sinistrosRecife2019Raw, sinistrosRecife2020Raw, sinistrosRecife2021Raw)


#Observando a estrutura
str(sinistrosRecifeRaw)
View(sinistrosRecifeRaw)

#modificando a data para formato date
sinistrosRecifeRaw$data <- as.Date(sinistrosRecifeRaw$data, format = "%Y-%m-%d")


#modificando a natureza do sinistro de texto para fator
sinistrosRecifeRaw$natureza_acidente <- as.factor(sinistrosRecifeRaw$natureza_acidente)

#modificando a natureza do bairro de texto para fator
sinistrosRecifeRaw$bairro <- as.factor(sinistrosRecifeRaw$bairro)

#criando uma função para substituir not available (na) por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

#aplicando a função naZero a todas as colunas de contagem
sinistrosRecifeRaw[, 14:24] <- sapply(sinistrosRecifeRaw[, 14:24], naZero)

#exportanto em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

#exportando em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")
