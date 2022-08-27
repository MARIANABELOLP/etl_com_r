# PACOTES #
pacman::p_load(data.table)

# LEITURA PARA TESTE DE CORRELAÇÃO #
enem_escola_pe_2019 <- fread('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/ENEM_ESCOLA_2019.csv', dec = ',')

View(enem_escola_pe_2019)

#Teste de Correlação (Pearson) - testa a associação entre variáveis numéricas 
cor.test(enem_escola_pe_2019$nota, enem_escola_pe_2019$TDI_03)
# o resultado do teste foi p-value < 2.2e-16 , ou seja, é 2,2 dividido por 10 elevado a 16, sendo, portanto, abaixo de 0,05, assim podemos rejeitar a hipótese nula e concluir pela hipótese alternativa (existência de associação entre as variáveis)
#observação: 0,05 = 5e-2. Para facilitar basta comparar se o número que vem antes do E é menor do que o 5 e se o número depois do E é maior do que 2.
# H0: variáveis são independentes / não têm associação. p-valor (p-value) > 0.05
# H1: variáveis são dependentes / há associação. p-valor (p-value) <= 0.05
# A estimativa da associação aparece embaixo. Cor -0.5610001, que fica entre o intervado de confiança entre  -0.6143985 -0.5024859. O sinal negativo indica que quando uma variável sobe a outra diminui.


# TESTE DE FREQUÊNCIA - Qui-quadrado - testa a associação entre variáveis categórias
milsa <- fread("http://www.leg.ufpr.br/~paulojus/dados/milsa.dat")
chisq.test(milsa$civil, milsa$instrucao)
# o resultado do teste foi p-value = 0.3843, ou seja, superior a 0,05, assim não podemos rejeitar a hipótese nula (aceitamos que não há associações entre as variáveis)
# H0: variáveis são independentes / não há associação. p-valor (p-value) > 0.05
# H1: variáveis são dependentes / há associação. p-valor (p-value) <= 0.05

#Test t(1 média) - tipo de varíavel numérica - testa se a média dos dados é igual a um valor de referência
t.test(milsa$salario, mu = 10)
# o resultado do teste foi p-value = 0.1511, ou seja, superior a 0,05, assim não podemos rejeitar a hipótese nula (a média pode ser igual ao valor de referência, pois o valor de referência 10 está dentro do intervalo de confiança)
#H0: a média é igual ao valor de referência
#H1: a média não é igual ao valor de referência

#Shapiro teste - Seu objetivo é avaliar se uma distribuição é semelhante a uma distribuição normal. Para dizer que uma distribuição é normal, o valor p precisa ser maior do que 0,05.
shapiro.test(enem_escola_pe_2019$nota)
# o resultado foi p-value < 2.2e-16 Logo, não é uma distribuição normal, como se observa no histograma abaixo:
hist(enem_escola_pe_2019$nota)


