iris<-read.table(file.choose(),sep=',')
iris
summary(iris)
data_norm<-function(x){((x-min(x))/(max(x)-min(x)))}
iris_norm<-as.data.frame(lapply(iris[,-5],data_norm))
iris_norm
iris_train<-iris_norm[1:30,]
iris_train
iris_test<-iris_norm[31:60,]
iris_test
iris_pred<-knn(iris_train,iris_test,iris[31:60,5],k=1)
library(class)
table(iris_pred,iris[31:60,5])
iris1<-table(iris_pred,iris[31:60,5])
acc<-function(d){sum(diag(d))/sum(d)}
iris_pred<-knn(iris_train,iris_test,iris[31:60,5],k=12)
table(iris_pred,iris[31:60,5])
iris1<-table(iris_pred,iris[31:60,5])
acc(iris1)
