#idade das minhas irmãs
m <- 33
a <- 35
k <- 46
t <- 47

#salvar todas as idades em uma única variável
idades <- c(m,a,k,t)

#análise das idades
família <- summary(idades)
família

#usando a função str()
str(família, max.level = NA, vec.len = 4 )