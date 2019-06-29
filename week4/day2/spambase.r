spambase<-read.table(file.choose(),sep=',')
spambase
summary(spambase)
data_norm<-function(x){((x-min(x))/(max(x)-min(x)))}
spambase_norm<-as.data.frame(lapply(spambase[,-58],data_norm))
spambase_norm
spambase_train<-spambase_norm[1:30,]
spambase_train
spambase_test<-spambase_norm[31:60,]
spambase_test
spambase_pred<-knn(spambase_train,spambase_test,spambase[31:60,7],k=6)
library(class)
table(spambase_pred,spambase[31:60,7])
spambase1<-table(spambase_pred,spambase[31:60,7])
acc<-function(d){sum(diag(d))/sum(d)}
acc(spambase1)

