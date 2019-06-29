
adult_train<-read.table(file.choose(),sep = ',')
colnames(adult_train)<-c ("age", "workclass", "fnlwgt", "education", 
                    "educationnum", "maritalstatus", "occupation",
                    "relationship", "race", "sex", "capitalgain",
                    "capitalloss", "hoursperweek", "nativecountry",
                    "incomelevel")

View(adult_train)
for(i in 1:3){
  adult_train=adult_train[,-2]
  
}
View(adult_train)
for(i in 1:5){
  adult_train=adult_train[,-3]
  
}
View(adult_train)
adult_train=adult_train[,-6]
View(adult_train)

rm(adult_test)
rm(adult_train)


adult_test<-read.table(file.choose(),sep = ',')
colnames(adult_test)<-c ("age", "workclass", "fnlwgt", "education", 
                    "educationnum", "maritalstatus", "occupation",
                    "relationship", "race", "sex", "capitalgain",
                    "capitalloss", "hoursperweek", "nativecountry",
                    "incomelevel")

View(adult_test)
for(i in 1:3){
  adult_test=adult_test[,-2]
  
}
View(adult_test)
for(i in 1:5){
  adult_test=adult_test[,-3]
  
}
View(adult_test)
adult_test=adult_test[,-6]
View(adult_test)





summary(adult_train)
data_norm<-function(x){((x-min(x))/(max(x)-min(x)))}
adult_train_norm<-as.data.frame(lapply(adult_train[,-6],data_norm))
adult_train_norm

summary(adult_test)
data_norm<-function(x){((x-min(x))/(max(x)-min(x)))}
adult_test_norm<-as.data.frame(lapply(adult_train[,-6],data_norm))
adult_test_norm


library(class)
adult_pred<-knn(adult_train,adult_test,adult_train[,6],k=1)
table(adult_pred,adult_train[,6])
adult1<-table(adult_pred,adult_train[,6])
acc<-function(d){sum(diag(d))/sum(d)}
acc(adult1)


