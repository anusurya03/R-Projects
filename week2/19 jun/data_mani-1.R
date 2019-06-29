#Data Manipulation with R
#Subset Data
str(d5)
nd1 <- d5[1:10,]
print(nd1)

nd2 <- subset(d5,State == "Delhi")
print(nd2)

nd3<-subset(d5, State=="Delhi" & Q1>10)
print(nd3)

#Sorting Data
nd4 <- d5[order(d5$State),]
print(nd4)

nd5 <- d5[order(-d5$Q1),]
print(nd5)

#Aggregate Data
nd6 <- aggregate(d5$Q1~d5$State,d5, sum, na.rm = TRUE)
print(nd6)

#Frequency
table(d5$State)

#Merging
df1 <- data.frame(ID = c(1, 2, 3, 4, 5),
                  w = c('a', 'b', 'c', 'd', 'e'),
                  x = c(1, 1, 0, 0, 1),
                  y=rnorm(5),
                  z=letters[1:5])
df2 <- data.frame(ID = c(1, 7, 3, 6, 8),
                  a = c('z', 'b', 'k', 'd', 'l'),
                  b = c(1, 2, 3, 0, 4),
                  c =rnorm(5),
                  d =letters[2:6])
#Inner Join
df3 = merge(df1, df2, by ="ID")
print(df3)



