#Carregando os pacotes
pacman::p_load(car, gvlma, lm.beta, lmtest, MASS, sandwich)

View(USArrests)

#Regressão Assault - Base USARRESTS
regUsarrests <- lm(Assault ~ ., data = USArrests) # lm é a função regressão linear. O ~ significa "em função de". No caso, queremos analisar Assault em função das outras variáveis (Murder, UrbanPop e Rap). No lugar de escrever "Murder + UrbanPop + Rap" é possível usar a função ponto para substituir todas as variáveis.#  
regUsarrests
summary(regUsarrests)
lm.beta(regUsarrests) #Regressão linear com estimadores padronizados

# Regressão linear Stepwise - serve para que a máquina diga quais variáveis devem ser utilizadas 
regUsarrestsBack <- step(
  lm(Assault ~ ., data = USArrests), direction = 'backward') # de trás pra frente
summary(regUsarrestsBack)

regUsarrestsForw <- step(
  lm(Assault ~ ., data = USArrests), direction = 'forward') #ordem normal
summary(regUsarrestsForw)

regUsarrestsBoth <- step(
  lm(Assault ~ ., data = USArrests), direction = 'both') # nos dois sentidos
summary(regSwissBoth)

# VERIFICAÇÃO DOS PRESSUPOSTOS - testes para saber se a regressão funcionou 
# normalidade dos resíduos - resíduo é a diferença entre o valor do modelo de regressão e o valor real dos dados. A diferença deve ser normal. p-Valor maior que 0.05 é normal.
shapiro.test(residuals(regUsarrests))
plot(regUsarrests, which=1, col=c("blue")) # normalidade dos resíduos em gráfico de equilíbrio. resíduos x ajuste
plot(regUsarrests, which=2, col=c("red")) # Os pontos devem ficar em cima da reta. Q-Q Plot
plot(regUsarrests, which=5, col=c("blue"))  # Observações Influentes (outliers) - atenção: caso apareça pontos na área de 0,5 a 1 é preocupante

#= Correção seria retirar as observações influentes =#

# teste de inflação da variância / multicolinearidade
vif(regUsarrests)
barplot(vif(regUsarrests), main = "VIF Values", horiz = FALSE, col = "steelblue", ylim = c(0,5))
abline(h = 5, lwd = 3, lty = 2) #cria uma linha no grafico de barras da linha acima, delimitando o limite máximo da inflação. Tudo que passa de 5 é preocupante e passando de 10 é alarmante.

#= Correção seria usar apenas uma das variáveis correlacionadas. Como: após fazer o teste de correlação e encontrar as variáveis correlacionadas, para escolher a variável que deve ficar aquela com t-value maior no teste da regressão (valor alto no t-value leva a valor baixo no p-valor) =#

# homocedasticidade (H0 = homocedasticidade)
bptest(regUsarrests) # teste de homocedasticidade busca p-value maior que 0.05, pois isso siginifica que há homocedasticidade (uniformidade)
plot(regUsarrests, which=3, col=c("blue"))  # Scale-Location Plot

#= Correção seria usar estimativas robustas =#
regUsarrests$robse <- vcovHC(regUsarrests, type = "HC1")
coeftest(regUsarrests, regUsarrests$robse)

regRUsarrests <- rlm(Assault ~ ., data = USArrests)
summary(regRUsarrests)
summary(regUsarrests)
