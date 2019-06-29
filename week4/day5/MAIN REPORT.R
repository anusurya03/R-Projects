library(ROCR)
library(rpart)
library(party)
library(partykit)
library(rpart.plot)
library(RColorBrewer)
library(dplyr)
library(caret)
library(rattle)
library(rvest)
library(stringr)
library(readr)
library(tm)
library(RSentiment)
library(wordcloud)
library(jpeg)
library(syuzhet)

adult<-read.table(file.choose(),sep = ',')
#View(adult)
adult1<-adult
#View(adult1)
adult1$V15<-as.integer(adult1$V15)

adult1%>%mutate(Target=ifelse(V15==">50K",1,0))->adult1
adult1%>%mutate(Target=ifelse(V15==2,1,0))->adult1
#View(adult1)
adult1<-adult1[,c(-3,-5,-7,-8,-15)]
#View(adult1) #decision tree performed on adult1
adult2<-adult1[,c(-2,-3,-4,-5,-6,-10)]
#View(adult2) #knn performed on adult2



summary(adult2)
data_norm<-function(x){((x-min(x))/(max(x)-min(x)))}

adult_norm<-as.data.frame(lapply(adult2[,-5],data_norm))
#View(adult_norm)
adult_train<-adult_norm[1:100,]
#View(adult_train)
adult_test<-adult_norm[101:200,]
#View(adult_test)
library(class)
acc<-function(d){sum(diag(d))/sum(d)}
for(i in 1:nrow(adult_train))
{
  adult_pred<-knn(adult_train,adult_test,adult2[101:200,5],k=i)
  #View(adult_pred)
  if(i==1)
  {
    p<-i
  }
  else
  {
    p<-append(p,i)
  }
  #table(adult_pred,adult2[101:200,5])
  adult3<-table(adult_pred,adult2[101:200,5])
  if(i==1)
    accuracy1<-acc(adult3)# 0.79
  else
  {
    accuracy1<-append(accuracy1,acc(adult3))
  }
}

accuracy1
p
plot(p,accuracy1,pch=19)
accuracy1<-max(accuracy1)
accuracy1#0.79(knn)



#DECISION TREE


#input.dat<-as.data.frame(adult1)
#output.adult<-rpart(V15~.,method = "class",data=input.dat)
#output.adult
#View(adult1)
summary(adult1$Target)

adult1$V9<-as.factor(adult1$V9)
adult1$V10<-as.factor(adult1$V10)
adult4<-adult1

mod<-rpart(Target~.,data=adult1,control=rpart.control(cp=0.002,maxdepth=4),method="class",parms=list(split="gini"))

plot(mod, margin=0.1, main="SALARY OF PEOPLE")
text(mod, use.n=TRUE, all=TRUE, cex=.7)

fancyRpartPlot(mod)

printcp(mod)
plotcp(mod, minline = TRUE)

mod1<-prune(mod,cp= 0.0037)

fancyRpartPlot(mod1)

mod1

#Confusion Matrix
actual<-adult1$Target



predicted<-predict(mod1,type = "class")

head(predicted)
head(as.numeric(predicted))
predicted<-as.numeric(predicted)
predicted<-ifelse(predicted==2,1,0)

mat<-confusionMatrix(predicted,actual,positive="1")#accuracy=0.8439
accuracy2 <- mat$overall['Accuracy']
accuracy2 #0.8439(decision tree)


#ROC curve analysis
library(ROCR)
pred<-prediction(actual,predicted)
perf<-performance(pred,"tpr","fpr")
plot(perf,col="red")
abline(0,1, lty = 8, col = "grey")

#Regresssion Tree
mod2<-rpart(Target~.,data=adult4,control=rpart.control(cp=0.009,minsplit = 30),method="anova")

plot(mod2, margin=0.1, main="SALARY")
text(mod2, use.n=TRUE, all=TRUE, cex=.7)

fancyRpartPlot(mod2)

printcp(mod2)
plotcp(mod2, minline = TRUE)

mod3<-prune(mod2,cp= 0.01)
fancyRpartPlot(mod3)

#Rule extraction
mod3

#Confusion Matrix
actual1<-adult4$Target
predicted1<-predict(mod3,method = "class")

head(predicted1)
head(as.numeric(predicted1))
predicted1<-as.numeric(predicted1)
predicted1<-ifelse(predicted1==2,1,0)

mat1<-confusionMatrix(predicted1,actual1,positive="1")
mat1
accuracy3<- mat1$overall['Accuracy']
accuracy3 #0.7591(regression tree)

#comparing accuracy1(knn) and accuracy2(Decision Tree)
accuracy<-c(accuracy1,accuracy2,accuracy3)

barplot(accuracy,col=rainbow(3),xlab="ACCURACY",ylim=c(0,1))


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
data_cnv(t)

