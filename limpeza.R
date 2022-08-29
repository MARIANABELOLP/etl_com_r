library(data.table)
library(dplyr)
library(tidyverse)
library(funModeling)

# carregando dados de covid19 no mundo
general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") 

# vetor que identifica países latino americanos
latin_america_countries <-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela")

# filtra casos apenas no vetor
latin_america <- general_data %>% filter(location %in% latin_america_countries) 

# reduzindo o df para 3 colunas específicas
latin_america <- latin_america %>% select(location, new_cases, new_deaths)

status(latin_america) # estrutura dos dados (missing etc)
freq(latin_america) # frequência das variáveis fator
plot_num(latin_america) # exploração das variáveis numéricas
profiling_num(latin_america) # estatísticas das variáveis numéricas

# Limpando os dados negativos
latin_america %>% filter(new_cases < 0) # para visualizar casos negativos

latin_america <- latin_america %>% filter(new_cases>=0) # retirando casos negativos


#removendo os NA(NOT AVAILABLE)
latin_america$new_deaths[which(is.na(latin_america$new_deaths))] <- 0
latin_america$new_cases[which(is.na(latin_america$new_cases))] <- 0
status(latin_america) 
