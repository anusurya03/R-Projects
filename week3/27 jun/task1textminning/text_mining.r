#Text Mining in R
#Loading the File in R
text = readLines("tubelight_review.txt")
print(text)
#Convert multiple Lines into One Text
text1 = paste(text,collapse = "")
print(text1)
#Cleaning Data in R
#1. Remove Puntuations
text2 = gsub(pattern="\\W", replace = " ", text1)
print(text2)
#2. Remove Numbers or Digits
text2 = gsub(pattern="\\d", replace = " ", text2)
print(text2)
#3. Convert entire text to lowercase
text2 = tolower(text2)
print(text2)
#4. Install and Load "tm" Package
install.packages("tm")
library(tm)
#5. Removing Certain Words(StopWords)
stopwords()
text2 = removeWords(text2,stopwords())
print(text2)
#6. Removing Words of Certain Length
text2 = gsub(pattern="\\b[A-z]\\b{1}", replace=" ", text2)
print(text2)
#7. Cleaning up all White Space
text2 = stripWhitespace(text2)
print(text2)
#Sentiment Analysis and Word Cloud
install.packages("stringr")
install.packages("wordcloud")
library(stringr)
library(wordcloud)
tb = str_split(text2, pattern="\\s+")#S+ One or More Space
print(tb)
#Convert List to Character Vector
tb1 = unlist(tb)
print(tb1)
#Create Positive and Negative Words Variables
poswords = scan("positive-words.txt", what='character', comment.char = ";")
print(poswords)
negwords = scan("negative-words.txt", what='character', comment.char = ";")
print(negwords)
#Compare the Text with Positive Words
match(tb1,poswords)
p = sum(!is.na(match(tb1,poswords)))
print(p)
n = sum(!is.na(match(tb1,negwords)))
print(n)
score = p - n
print(score)
#Creating WordCloud
wordcloud(tb1,min.freq = 1,random.order = FALSE,scale=c(3,0.5),color = rainbow(3))

#Text Mining from multiples text files in a folder or directory

