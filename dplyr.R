library(dplyr)

facebook <- read.table("https://raw.githubusercontent.com/hugoavmedeiros/cd_com_r/master/bases_originais/dataset_Facebook.csv", sep=";", header = T)

View(facebook)
str(facebook)


#script completo para renomear uma coluna
facebook <- rename (facebook, Reach = Lifetime.Post.Total.Reach)

#script simplificado para renomear uma coluna
facebook %>% rename (Reach = Lifetime.Post.Total.Reach)


#selecionando colunas específicas
Post.MWH <- select(facebook, Post.Month, Post.Weekday, Post.Hour)

# sumários
count(facebook, Post.Month) 

#Transformações
comentariosMes <- facebook %>% group_by(Post.Month) %>% summarise(avg = mean(comment))
arrange(comentariosMes, avg)

