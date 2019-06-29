for(i in 1:5)
{
  for(j in 5:i)
  {  cat(" ")}
  for(k in 1:i)
  {cat(k)
  }
  for(q in i-1:i)
  {
    if(q==0)
      cat(" ")
    else cat(q)}
  
  cat("\n")
}
  