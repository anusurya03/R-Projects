#FACEBOOK MINNING IN R
install.packages("Rfacebook")
install.packages("RCurl")
fb_auth=fbOAuth(app_id = "158622211348335",app_secret = "2c7a56eab6c185487957fb389bc0f2a5",extended_permissions = TRUE)
like=getLikes(user = "me",token = fb_auth)
sample(like$names,10)
#updateStatus("TRAINING IN R",token = fb_auth)
page=searchPage(string="GST",token=fb_auth,n=10)
head(page$name)
page=getPage(page = "GSTindiaupdates",token=fb_auth,n=5)
page$message
fb_auth=fbOAuth(app_id = "158622211348335",app_secret = "2c7a56eab6c185487957fb389bc0f2a5",extended_permissions = TRUE)
m=getUsers("me",fb_auth,private_info = TRUE)
m$name
like=getLikes(user = "me",token = fb_auth)
like
sample(like$names,10)
#updateStatus("TRAINING IN R",token = fb_auth)
page=searchPage(string="GST",token=fb_auth,n=10)
head(page$name)
page=getPage(page = "GSTindiaupdates",token=fb_auth,n=5)
page$message
page=searchPages(string="GST",token=fb_auth,n=10)
head(page$name)
page$likes
page=getPage(page = "GSTindiaupdates",token=fb_auth,n=5)
page$message
page$likes_count
which.max(page$likes_count)
summary=page[which.max(page$likes_count)]
summary$likes_count
summary$message
which.max(page$comments_count)
page$comments_count
post<-getPost(page$id[1],token = fb_auth,n.comments = 1000,likes = F)
post
p
post$comments
#fix(comments)
comments<-post$comments
#fix(comments)
token1="EAACEdEose0cBAOJbvWajiZBiIu8VUv0Hxh0JcT8lPAfHe9wSDJCaSkD5HaGdtxJ3xVL4cudJSglkqsYrM6lZBDnsqKnkcIjtkOKjKqoIVYV1FXHMentNtIJ2ZAzTMH2kIPdDP3FrFHI9pcVQZCWswvMe5NBwmNN7IKX4B38zM4DFkJSmzFLS4OEE65lO8bAZD"
my_friends<-getFriends(token1,simplify = FALSE)
View(my_friends)
my_friends$gender

                      

