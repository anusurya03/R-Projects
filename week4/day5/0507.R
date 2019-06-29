library(rpart)				       
library(rattle)					# Fancy tree plot
library(rpart.plot)				# Enhanced tree plots
library(RColorBrewer)				# Color selection for fancy tree plot
library(party)					# Alternative decision tree algorithm
library(partykit)				# Convert rpart object to BinaryTree
#install.packages("caret")
library(caret)
#install.packages("party")
#install.packages("rpart")

library(party)
k=read.csv("book2.csv")
print((k))

# Create the input data frame.
input.dat <-as.data.frame(k)

output.tree <- rpart(play ~ day + outlook + temp + 
                       humidity + wind ,method = "class",data = input.dat)
output.tree
# Plot the tree.
rpart.plot(output.tree)
#plot(model)
library(dplyr)
fancyRpartPlot(output.tree)	
filter(k,k$outlook=="overcast")
b=filter(k,k$outlook!="overcast")
c=b%>%count(play=="y")
c
filter(b,humidity=="high")


kyphosis
fit=rpart(Kyphosis~ Age + Number +Start, 
          method = "class", data = kyphosis)
fit=rpart(Kyphosis~ ., 
          method = "class", data = kyphosis)
plot(fit,uniform = TRUE,main="yo")
text(fit,use.n = TRUE,all = TRUE,cex=0.8)
rpart.plot(fit)
fancyRpartPlot(fit)
rpart.plot(fit)
library(dplyr)
kyphosis
z=filter(kyphosis,kyphosis$Start<8.5)
z
count(filter(z,Kyphosis=="absent"))

#y=group_by(z,Kyphosis)
#summarise(y,count(Age))
bb=filter(kyphosis,kyphosis$Start>=8.5)
count(filter(bb,Kyphosis=="absent"))

filter(kyphosis,kyphosis$Start>=14)







#install.packages("rpart")
#install.packages("rpart.plot")
library("rpart")
library("rpart.plot")
data("iris")
View(iris)
indexes = sample(150, 110)
iris_train = iris[indexes,]
iris_test = iris[-indexes,]
count(iris_train)
target = Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width


tree = rpart(target, data = iris_train, method = "class")
rpart.plot(tree)


predictions = predict(tree, iris_test)
#table(predictions, iris_test[,5])
