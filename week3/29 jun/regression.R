 x=c(1,2,3,4,5,6,7,8,9)
 y=c(3,6,9,12,15,18,21,24,27)
 h=data.frame(x,y)
 h
 plot(h)
 out=lm(y~x,data=h)
 out
 summary(out)
 abline(out)
 test=data.frame(x=c(14,4,10))
 test
 r=predict(out,test)
 r
 p=c(14,4,10)
 k=data.frame(p,r)
  plot(x,y,ylim=c(0,50),xlim=c(0,20),pch=5)
 points(r~p,data=k,pch='+')
 abline(out)
 predict(out,data.frame(x=11))
 predict(out,data.frame(x=11),interval='confidence')
 cor(x,y)
 resid(out)
 plot(resid(out))
 abline(h=0)
 
 
 x=c(95,85,80,70,60)
 y=c(85,95,70,65,70)
 g=data.frame(x,y)
 out=lm(y~x,data=g)
 out
 summary(out)
 plot(x,y)
 abline(out)
 test=data.frame(x=c(90,79,70))
 test
 r=predict(out,test)
 r
 p=c(90,79,70)
 k=data.frame(p,r)
 plot(x,y)
 
 #plot(x,y,ylim=c(0,50),xlim=c(0,20),pch=5)
 points(r~p,data=k,pch='+')
 abline(out)
 predict(out,data.frame(x=11))
 predict(out,data.frame(x=11),interval='confidence')
 

 
 
 
mx=mean(x)
mx
my=mean(y)
my
a=x-mx
a
b=y-my
b
aa=a*a
aa
cc=b*b
cc
bb=a*b
bb
b1=sum(bb)/sum(aa)
b0=mean(y)-b1*mx
b1
b0
s1=sqrt(sum(aa)/5)
s2=sqrt(sum(cc)/5)
z=((1/5)*(sum(bb))/(s1*s2))
z
(z*z)
t=data.frame(x=c(95,85,80,70,60))
pred=predict(out,t)
pred
error=y-pred
error
plot(error)
cor(x,y)
resid(out)
plot(x,resid(out))
abline(h=0)


###1-SSE/SST=R2
pred
y
tt=sum(cc)
rr=sum((y-pred)*(y-pred))
1-(rr/tt)###R2
sqrt(rr/3)###residual std. error

