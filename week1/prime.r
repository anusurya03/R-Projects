n=scan
cat("2"," ")
for(i in 2:n){prime=1

for(j in 2:(i/2))
{ 
  if (i%%j==0)
    {
    prime=0
    break
  }
}
}
if(prime==1){
  cat(i," ")
}
