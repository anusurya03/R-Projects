oo=c(1,2,3,4,5,7,9,13,14,15,16,20)
summary(oo)
median(oo[1:6])
median(oo[1:7])
median(oo[6:12])
median(oo[7:12])
str(airquality)

fw
boxplot(fw$speed)
boxplot(fw$speed,fw$count)
boxplot(fw$speed,fw$count,names=c('count','speed'))
title(xlab = 'var',ylab = 'value')
boxplot(fw$speed,fw$count,names=c('count','speed'),range = 1,
        xlab = 'var',ylab = 'value',col = 'blue')

rich=c(12,15,17,11,15,8,9,7,9)
graze=c('mow','mow','mow','mow','mow','unmow','unmow','unmow','unmow')
grass=data.frame(rich,graze)
grass
boxplot(rich~graze,data=grass,range=0)#no need of xlab ylab

boxplot(rich~graze,data=grass,range=0,horizontal=T)#no need of xlab ylab
title(ylab = 'cutting treatment',xlab = 'species richness')
with(fw,boxplot(speed,col='black'),range=1)
load("D:/r/Beginning.RData")
names(bf)
boxplot(bf[c(2,3,1)])

fw
plot(fw$speed,fw$count,ylim = c(0,100))
with(fw,plot(speed,count))
attach(fw)
plot(speed,count)
detach(fw)

plot(fw$speed,fw$count,ylim = c(0,100),xlab = 'u',ylab = 'l')
plot(fw$speed,fw$count,ylim = c(0,100),xlab = '',ylab = '')
plot(1,26)
plot(fw$speed,fw$count,ylim = c(0,100),xlab = 'u',ylab = 'l')

plot(fw$speed,fw$count,xlab="speed",ylab = "count",pch=1,col="blue"
     ,xlim=c(0,50),ylim=c(0,50))

plot(count~speed,data = fw)
abline(lm(count~speed,data=fw),lwd=6,col='gray50')

plot(count~speed,data = fw,xlab='speed',ylab = 'count',pch=18,
     cex=2,xlim=c(0,50),ylim=c(0,50))
abline(lm(count~speed,data=fw),lwd=6,col='gray50')

fw
plot(fw)

head(mf)
plot(mf)

pairs(~Length+Speed+NO3,data=mf,col='red',cex=2,pch='X')

rain
rainfall

Nile
plot(Nile)
plot(Nile,type='l')
plot(Nile,type='p')
plot(Nile,type='b')
plot(Nile,type='o')
plot(Nile,type='c')
plot(Nile,type='n')

with(mf,plot(Length,NO3,type = 'l'))
with(mf[order(mf$Length),],plot(sort(Length),NO3,type='o'))

rain
plot(rain,type = 'b')

rainfall
plot(rainfall$rain,type='b')


plot(rain,type='b',axes=FALSE,xlab='mon',ylab = 'rain cm')
axis(side=1, at=1:length(rain),labels = month)
axis(side=2)
box()


data11
data8
pie(data11,labels=data8)

pc=c('red','blue','green','tan','black')
pie(data11,labels = data8,col=pc,clockwise = F,init.angle = 90)

fw
pie(fw$count,labels = row.names(fw),col=rainbow(7),cex=1,init.angle = 90)
library(plotrix)
pie3D(fw$count,labels = row.names(fw),col=rainbow(7),cex=1,explode = 0.2)
bird
pie(bird[,1],col=pc)
pie(bird[,2],col=pc)
pie(bird[,'Hedgerow'])

slices <-c(10, 12,4, 16, 8)
lbls <-c("US", "UK", "Australia", "Germany", "France")
pie( slices, labels = lbls, main="Simple Pie Chart")

slices <-c(10, 12,4, 16, 8)
pct <-round(slices/sum(slices)*100)
lbls <-paste(c("US", "UK", "Australia",
               "Germany", "France"), " ", pct, "%", sep="")
pie(slices, labels=lbls,
    col=rainbow(5),main="Pie Chart with Percentages")


library(plotrix)
slices <-c(10, 12,4, 16, 8)
lbls <-paste(
  c("US", "UK", "Australia", "Germany", "France"),
  " ", pct, "%", sep="")
pie3D(slices, labels=lbls,explode=0.0,
      main="3D Pie Chart")

x=c(2,5,44,3,2,23,66,88,43)
hist(x,breaks=4,col='blue')


dotchart(data11,labels=data8)
dotchart(bird)
dotchart(t(bird))
dotchart(t(bird),cex = 0.2)
dotchart(t(bird),cex = 0.8)
dotchart(t(bird),cex = 0.8,col=rainbow(5))
dotchart(t(bird),cex = 0.8,col=rainbow(6))
dotchart(t(bird),cex = 0.8,col=rainbow(5))