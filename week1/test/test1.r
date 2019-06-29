a=c(1,4,5,9,10)
b=c(1,5,10,11,13)

for(i in 1:length(a))
{
for(j in 1:length(b)){
  if(a[i]==b[j]){
    d[i]=a[i]
  }
}
}
e=which(is.na(d))
cat(a[e])

