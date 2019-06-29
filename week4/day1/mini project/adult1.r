library(rvest)
library(stringr)
library(readr)
library(tm)
library(RSentiment)
library(wordcloud)
library(jpeg)
library(syuzhet)
t=readLines("ada.txt")
#Function for data cleaning
data_cnv<-function(t)
{  
  #Convert multiple Lines into One Text
  text1 = paste(t,collapse = "")
  #1. Remove Puntuations
  text1 = gsub(pattern="\\W", replace = " ", text1)
  #2. Remove Numbers or Digits
  text1 = gsub(pattern="\\d", replace = " ", text1)
  #3. Convert entire text to lowercase
  text1 = tolower(text1)
  #5. Removing Certain Words(StopWords)
  #stopwords()
  text1 = removeWords(text1,stopwords())
  #6. Removing Words of Certain Length
  text1 = gsub(pattern="\\b[A-z]\\b{1}", replace=" ", text1)
  #7. Cleaning up all White Space
  text1 = stripWhitespace(text1)
  #Sentiment Analysis
  
  #S+ One or More Space
  tb = str_split(text1, pattern="\\s+")
  tb1 = unlist(tb)
  cat("\n \n")
  #Creating WordCloud
  wordcloud(tb1,min.freq = 1,random.order = FALSE,scale=c(3,0.5),color = rainbow(3))
  #to lower
  text1=tolower(text1)
  #cat("\n text1=",text1)
  
  
  #Calculating Polarity and Sentiment Score
  g_score = get_nrc_sentiment(text1)
  #cat("\n\n",g_score)
  #g_polarity = g_score[1,9:10]
  #cat("\n\n",g_polarity)
  g_polarity = g_score[1,9:10]
  g_polarity = data.matrix(g_polarity, rownames.force = TRUE)
  print(g_polarity)
  
  g_sentiment = g_score[1,1:8]
  g_sentiment = data.matrix(g_sentiment,rownames.force = TRUE)
  print(g_sentiment)
  
  old.par <- par(mfcol=c(1, 3))
  
  #Visualizing a WordCloud
  wordcloud(tb1,min.freq = 1,random.order = FALSE,scale=c(3,0.5),color = rainbow(3))
  #Visualize Polarity and Sentiment
  barplot(g_polarity,col ='green')
  barplot(g_sentiment,col = 'blue')
  par(old.par)
}
