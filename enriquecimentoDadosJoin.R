library(dplyr)
library(tidyverse)

#criando um data frame com os nomes dos estados

cod_state <- 1:50
states_names <- data.frame( cod_state, state.name)
View(states)

#criando um data frame com as áreas dos estados
states_area <- data.frame (cod_state, state.area)
View(states_area)

#juntando as informações anteriores
states_names_area <- inner_join(states_names, states_area)
View(states_names_area)

#criando um data frame com código diferente
cod <- 6:55
states_area2 <- data.frame (cod, state.area)
View(states_area2)

#com o inner só aparecem os resultados comuns 
states_names_area2 <- inner_join(states_names, states_area2, by = c("cod_state" = "cod"))
View(states_names_area2)

#com o left, aparecem todos os resultados da base da esquerda
states_names_area3 <- left_join(states_names, states_area2, by = c("cod_state" = "cod"))
View(states_names_area3)

#com o right, aparecem todos os resultados da base da direita
states_names_area4 <- right_join(states_names, states_area2, by = c("cod_state" = "cod"))
View(states_names_area4)


#com o full, aparecem todos os resultados
states_names_area5 <- full_join(states_names, states_area2, by = c("cod_state" = "cod"))
View(states_names_area5)
