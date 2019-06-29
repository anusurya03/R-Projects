tr1<-readLines("beauty1.txt")
tr1
tr2<-paste(tr1,collapse = " ")
tr2
tr2<-gsub(pattern = "\\W",replace=" ",tr2)
tr2
#removing digitstr2<-gsub(pattern = "\\d",replace=" ",tr2)
tr2<-gsub(pattern = "\\d",replace=" ",tr2)
tr2
tr2<-tolower(tr2)
tr2
install.packages("tm")
library(tm)
stopwords()
tr2<-removeWords(tr2,stopwords())
tr2
tr2<-gsub(pattern = "\\b[A-Z]b{1}",replace=" ",tr2)
tr2
tr2<-stripWhitespace(tr2)
tr2
install.packages("stringr")
library(stringr)
#to split string in words
tb1<-str_split(tr2,pattern = "\\s+")
tb1
install.packages("wordcloud")
library(wordcloud)
#wordcloud(tb1,random.order = F,min.freq = 0.35,col=rainbow(12))
tb1=unlist(tb1)
tb1
wordcloud(tb1,random.order = F,min.freq = 0.35,col=rainbow(12))
pw1<-scan("positive-words.txt",what = "character",comment.char = ";")
pw1
pw2<-scan("negative-words.txt",what = "character",comment.char = ";")
pw2
#matching from text
match(tb1,pw1)
match(tb1,pw2)
p=sum(!is.na(match(tb1,pw1)))
p
n=sum(!is.na(match(tb1,pw2)))
n
score=p-n
score
