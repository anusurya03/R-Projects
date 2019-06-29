#Comparison WordCloud of Multiple Text
folder = "C:\\Users\\AJ\\Documents\\multi"
filelist = list.files(path=folder, pattern = "*.txt")
print(filelist)
#Getting Exact File URL
filelist = paste(folder,"\\", filelist, sep="")
print(filelist)
#Reading All the Files
mtext = lapply(filelist, FUN = readLines)
print(mtext)
mtext1 = lapply(mtext,FUN=paste,collapse=" ")
print(mtext1)
#Cleaning Text
#1. Remove Puntuations
mtext1 = gsub(pattern="\\W", replace = " ", mtext1)
print(mtext1)
#2. Remove Numbers or Digits
mtext1 = gsub(pattern="\\d", replace = " ", mtext1)
print(mtext1)
#3. Convert entire text to lowercase
mtext1 = tolower(mtext1)
print(mtext1)
#4. Install and Load "tm" Package
install.packages("tm")
library(tm)
#5. Removing Certain Words(StopWords)
stopwords()
mtext1 = removeWords(mtext1,stopwords("english"))
print(mtext1)
#6. Removing Words of Certain Length
mtext1 = gsub(pattern="\\b[A-z]\\b{1}", replace=" ", mtext1)
print(mtext1)
#7. Cleaning up all White Space
mtext1 = stripWhitespace(mtext1)
print(mtext1)
#Sentiment Analysis and Word Cloud
install.packages("stringr")
install.packages("wordcloud")
library(stringr)
library(wordcloud)
tb = str_split(mtext1, pattern="\\s+")#S+ One or More Space
print(tb)
wordcloud(mtext1)
corpus1 = Corpus(VectorSource(mtext1))
print(corpus1)
x11()#Create New Graphics Window
#Create Term Document Matrix
tdm = TermDocumentMatrix(corpus1)
print(tdm)
mat1 = as.matrix(tdm)
mat1
colnames(mat1)
colnames(mat1) = c("Arsenal","Chelsea","Liverpool")
mat1
comparison.cloud(mat1)

#Sentiment Analysis
mtext2 = str_split(mtext1,pattern="\\s+")
mtext2
#Create Positive and Negative Words Variables
poswords = scan("positive-words.txt", what='character', comment.char = ";")
print(poswords)
negwords = scan("negative-words.txt", what='character', comment.char = ";")
print(negwords)
p = unlist(lapply(mtext2, function(x){sum(!is.na(match(x,poswords)))}))
print(p)
n = unlist(lapply(mtext2,function(x){sum(!is.na(match(x,negwords)))}))
print(n)
score = p-n
score
hist(score)
