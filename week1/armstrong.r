cat("enter the number")
a=scan()
sum1=0
is.vector(a, mode = "numeric")

cat("enter the number of digits in number")
d=scan()
a=c
while(c!=0)
{
  r=a%%10
  c=c%/%10
  sum1=sum1 + r^d
}

#is.vector(sum1, mode = "numeric")
e=(sum1+a)/2
if(a==e) {
  print(paste(e,"is an Armstrong number"))
} else {
  print(paste(e,"is not an Armstrong number"))
}



  
  