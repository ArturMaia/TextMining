library(dplyr)
library(ggplot2)  
library(tidytext)  
library(rvest)  
library(stringr)  
library(wordcloud)
library(htmltools)
library(tm)
library(wesanderson)

noticia="https://blog.dsacademy.com.br/10-livros-incriveis-para-iniciar-a-carreira-de-analista-de_dados/"
leitura <- read_html(c(noticia)) 
texto <-  leitura %>%
  html_nodes("p") %>%
  html_text() 
texto <- as.data.frame(texto)

transformar_texto <- tolower(texto)#tornar letras minúsculas
transformar_texto <- removePunctuation(transformar_texto)#remove pontos
transformar_texto <- removeNumbers(transformar_texto)#remover números
transformar_texto <- stripWhitespace(transformar_texto)#remover espaços
stopwords_pt <- c(stopwords("pt"),"o","é","do","ser", "nesse","mas")
leia<- removeWords(transformar_texto , stopwords_pt)
wordcloud(leia,scale=c(4,0.4),max.words=15,color=wes_palette("Royal1"))
