facebook <- read.table("https://raw.githubusercontent.com/hugoavmedeiros/cd_com_r/master/bases_originais/dataset_Facebook.csv", sep=";", header = T)

View(facebook)
str(facebook)

pacman::p_load(funModeling, tidyverse)

glimpse(facebook) #olhada nos dados

status(facebook [1:5]) #apresenta a estrutura dos dados. q_zeros: quantidade de zeros / p_zeros: probabilidade de zeros / na: sem resultado (ausentes) / inf: infinito / unique: casos únicos

freq(facebook) #o pacote funmodeling busca automaticamente as variáveis que são fatores e calcula a frequência delas. Mesmo não tendo nenhuma variável como fator, o pacote apresentou resultado para a variável TYPE (CHARACTER) 

plot_num(facebook [4:6]) #exploração das variáveis numéricas

profiling_num(facebook [4:6]) #fornece todas as estatísticas das variáveis numéricas
