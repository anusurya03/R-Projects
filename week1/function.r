add_num2<-function(x,y){
  return((x+y)/2)
}
firstTwoChars<-function(){
  c=scan(what = "character")
return(substr(c,1,2))
}
getAge<-function(){
  a=scan()
  if(a<18){
    cat("not eligible to vote")
  }else{
    cat("eligible to vote")
  }
}
recursive.fact<-function(x) {
  if (x == 0) return (1)
  else return (x * recursive.fact(x-1))
}

sum <- function() {
  cat("enter number")
  num<-scan()
  sum=0
  while(num>=1)
  {
    sum=sum+num
    num=num-1
  }
  return(sum)
}

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

fibonacci<-function(n){

  a=0
  b=1
  cat(a)
  cat(" ")
  cat(b)
  cat(" ")
  for(i in 1:n)
  {c=a+b
  cat(c)
  cat(" ")
  a=b
  b=c
  }
}


