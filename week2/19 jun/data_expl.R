#Basic Data Exploration in R
mydata <- read.csv("Data1.csv", header = TRUE)
#If the parameter "header=" is "TRUE", then the first row will be treated as the row names. 
#Calculating Basic Descriptive statistics
summary(mydata)
summary(mydata[2])
summary(mydata$Q4)
#Lists name of variables in a dataset 
names(mydata)
#Calculate number of rows in a dataset
nrow(mydata)
#Calculate number of columns in a dataset
ncol(mydata)
#List structure of a dataset 
str(mydata)
#See first 6 rows of dataset 
head(mydata)
head(mydata, n=5)
head(mydata,n=-1)#All rows but the last row 
#Last 6 rows of dataset 
tail(mydata)
#Number of missing values
colSums(is.na(mydata))
sum(is.na(mydata$Q1))#Number of missing values in a single variable
