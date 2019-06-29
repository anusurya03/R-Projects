x=c(1,2,3,4,5,6,7,8,9)
y=c(3,6,9,12,15,18,21,24,27)
h=data.frame(x,y)
h
plot(h)
out=lm(y~x,data=h)
out
summary(out)
abline(out)
#plot(out)
test=data.frame(x=c(14,4,10))
test
r=predict(out,test)
r
p=c(14,4,10)
k=data.frame(p,r)
k
plot(x,y,ylim=c(0,50),xlim = c(0,20),pch=5)
#points(rp,data=k,pch='+')
points(r~p,data=k,pch='+')
abline(out)
predict(out,data.frame(x=11),interval='confidence')
predict(out,data.frame(x=11))
cor(x,y)
resid(out)
plot(resid(out))
abline(h=0)

#############
x=c(95,85,)
y=c(3,6,9,12,15,18,21,24,27)
g=data.frame(x,y)
g
out
summary(out)
plot(x,y)
out=lm(y~x,data=h)
out
summary(out)
abline(out)
#plot(out)
test=data.frame(x=c(14,4,10))
test
r=predict(out,test)
r
p=c(14,4,10)
k=data.frame(p,r)
k
plot(x,y,ylim=c(0,50),xlim = c(0,20),pch=5)
#points(rp,data=k,pch='+')
points(r~p,data=k,pch='+')
abline(out)
predict(out,data.frame(x=11),interval='confidence')
predict(out,data.frame(x=11))
cor(x,y)
resid(out)
plot(resid(out))
abline(h=0)




m_x=mean(x)
m_x
m_y=mean(y)
m_y
a=x-m_x
a
b=y-m_y
b
aa=a*a
aa
cc=b*b
cc
bb=a*b
bb
b1=sum(bb)/sum(aa)
b0=mean(y)-b1*m_x
b1
b0


##1-sse/sst######################################
pred