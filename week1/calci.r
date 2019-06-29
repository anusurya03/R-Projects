calculate<-function(){
  cat("enter first number")
  a=scan()
  cat("enter second number")
b=scan()
cat("n")
n=scan()
for(i in 1:n){
  cat(i)
  c[i]=scan(what="character")
switch(c[i],"+"=print(a[i]+b[i]),"-"=print(a[i]-b[i]),"*"=print(a[i]*b[i]),"%"=print(a[i]%%b[i]))}
}
calculate()
