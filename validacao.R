facebook <- read.table("https://raw.githubusercontent.com/hugoavmedeiros/cd_com_r/master/bases_originais/dataset_Facebook.csv", sep=";", header = T)

View(facebook)
str(facebook)

pacman::p_load(funModeling, tidyverse)

pacman::p_load(data.table, dplyr, validate)

#análise das interações dos post de dezembro 

facebook <- facebook %>% select (Post.Month, comment, like, share)

facebook <- facebook %>% filter(Post.Month > 11)

facebook <- facebook %>% filter(like > mean(like))

regras_facebook <- validator (Post.Month > 11, like > 172.18)

validacao_facebook <- confront  (facebook, regras_facebook)

summary(validacao_facebook)

plot(validacao_facebook)


