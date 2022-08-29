library(data.table)
library(dplyr)
library(tidyverse)

# carregando os dados de covid no mundo
covid_mundo<-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") 

View(covid_mundo)


# filtrando os países pelo continente - selecionando américa do sul
america_sul <- covid_mundo %>% filter (continent %in% "South America")

# criando uma nova base ---> agrupando pela coluna location; criando uma nova coluna (n_casos) com o número da linhas; selecionando apenas os dados de 3 colunas (location, total_deaths, n_casos)
total_america_sul <- america_sul %>% group_by(location) %>% mutate (n_casos = row_number()) %>% select(location, total_deaths, n_casos)


#analisando a diferença sem agrupar 
total_america_sul2 <- america_sul %>% mutate (n_casos = row_number()) %>% select(location, total_deaths, n_casos) 

View(total_america_sul)
View(total_america_sul2)# não observei nenhuma diferença no environment nem no view

summarise(total_america_sul)
summarise(total_america_sul2) #apresenta diferença nessa função


# igualando o número de casos
# primeiro: obter o número mínimo comum de casos ---> agrupando pela coluna location; filtrando pelo número máximo de casos
resultado <- total_america_sul %>% group_by(location) %>% filter (n_casos == max(n_casos))
View(resultado) #número mínimo 877 casos

# segundo: para finalmente igualar ---> filtra a coluna de casos com números menores ou iguais ao mínimo do df anterior
total_america_sul <- total_america_sul %>% filter (n_casos<=min(resultado$n_casos))
View(total_america_sul) #877 casos x 13 países = 11401 observações

#Mudar a direção (pivotar) do data frame de long para wide ----> 

total_america_sul_wide <- total_america_sul %>% pivot_wider (names_from = n_casos, values_from = total_deaths) %>% remove_rownames %>% column_to_rownames(var= "location")
View(total_america_sul_wide)

# Mudando a direção de outro data frame - long para wide
data()
View(Orange)
Orange2 <- Orange %>% pivot_wider (names_from = age, values_from = circumference ) %>% remove_rownames %>% column_to_rownames(var = "Tree")
View(Orange2)


