#Sentiment Analysis
install.packages("syuzhet")#Sentiment Analysis
install.packages("readr")#For Reading Files
library(syuzhet)
library(readr)
library(wordcloud)
#Reading File
gandhi_speech = read_file("gandhi_speech.txt")
View(gandhi_speech)
gandhi_speech=tolower(gandhi_speech)
#Calculating Polarity and Sentiment Score
g_score = get_nrc_sentiment(gandhi_speech)
g_score
g_polarity = g_score[1,9:10]
g_sentiment
g_sentiment = g_score[1,1:8]
#Visualize Polarity and Sentiment
g_polarity = data.matrix(g_polarity, rownames.force = TRUE)
g_polarity
barplot(g_polarity)
g_sentiment = data.matrix(g_sentiment,rownames.force = TRUE)
barplot(g_sentiment)
#Breaking the text in sentence
g_speech_sen = get_sentences(gandhi_speech)
g_speech_sen

sentiment_v = get_sentiment(g_speech_sen, method = "syuzhet")
??get_sentiment
sentiment_v
summary(sentiment_v)
boxplot(sentiment_v)

#Getting Sentence with maximum Score
max(sentiment_v)
df_sent = data.frame(g_speech_sen,sentiment_v)
View(df_sent)
mp = df_sent[which.max(df_sent$sentiment_v),]
mp

#Minimum Score
min(sentiment_v)
minp = df_sent[which.min(df_sent$sentiment_v),]
minp

??tm_map


