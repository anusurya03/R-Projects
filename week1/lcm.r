a=scan()
b=scan()
  if(a>b){
    c=a}else c=b
while(c>=2)
  {
    if(c%%a==0&&c%%b==0)
    {lcm=c
    cat("lcm",lcm)
    break}
  else {c=c+1}
}
  
