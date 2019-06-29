shopping_cart<-function()
{print("select menu")
  print("1.mobile")
  print("2.books")
  print("3.men_clothing")
  print("4.women_clothing")
  print("5.home_decor")
a=scan(what="character")
switch(a,"1"=mobile(),"2"=books(),"3"=men_clothing(),"4"=women_clothing(),"5"=home_decor())
}

books<-function()
{
  product<-c("palace of illusion","secret holder","norway diaries")
  price<-c(650,129,345)
  
  df1<-data.frame(product,price)
  df1
}

men_clothing<-function()
{
  product<-c("shirt","t_shirts","shoes")
  price<-c(750,495,1200)
  df2<-data.frame(product,price)
  df2
}

women_clothing<-function()
{
  product<-c("saree","suits","gowns")
 price<-c(1000,795,3000)
 df3<-data.frame(product,price)
 df3
}

home_decor<-function()
{
  product<-c("curtains","bedsheets","sofa")
  price<-c(1000,770,4000)
  df4<-data.frame(product,price)
  df4
}
mobile<-function()
{ product<-c("samsung","iphone","blackberry")
price<-c(17000,81000,23000)
df<-data.frame(product,price)
print(df)
mat<-data.matrix(product)
mat
#print("select i,j")
print("\n How many records you want to enter=")
rec=scan()
#for(i in 1:rec)
print("select i,j")
i=scan()
j=scan()
pay<-df[i,j]
#count=count+1

print(pay)
#print(count)
print("choose contract length")
print("3")
print("6")
print("9")
print("12")
contract=scan()
print(contract)
#contract=con
discount(pay,contract)
}
discount<-function(pay,contract){
  if(contract==3){
    price=pay-pay*0.1
    
    cat("date:",Sys.Date())
    print(Sys.Date())
    print("contract end date:")
    print(as.Date(Sys.Date()) + 90)
    return(price)
    
    
    
  }
 else if(contract==6){
    price=pay-pay*0.2
    return(price)
    cat("date:",Sys.Date())
    cat("contract end date:",as.Date(sys.date) + 180)
 }
   else if(contract==9){
    price=pay-pay*0.3
    return(price)
    cat("date:",Sys.Date())
    cat("contract end date:",as.Date(sys.date) + 270)
   }else{
    price=pay-pay*0.4
    return(price)
    cat("date:",Sys.Date())
    cat("contract end date:",as.Date(sys.date) + 360)
   }
  
  
}
add_cart<-function(){
   print(df)
   print("enter k(rows) l(colums)")
   k=scan()
   l=scan()
   print(df[k,l])
   print("\n PRoduct entered in cart")
   count=count+1
   
   
  
}
