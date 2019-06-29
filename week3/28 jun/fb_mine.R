#Facebook Data Mining using R
#Open https://developers.facebook.com/ and register yourself
#Install the Required Packages
install.packages("Rfacebook")
install.packages("RCurl")
#Load the Packages
library(Rfacebook)
library(RCurl)
fb_oauth <- fbOAuth(app_id="####", app_secret="###",extended_permissions = TRUE)
#checking Profile Account Information
me <- getUsers("me",token=fb_oauth, private_info=TRUE)
me$name
#Listing all the Pages Liked
likes = getLikes(user="me", token = fb_oauth)
sample(likes$names, 10)
#Updating Status from R
updateStatus("this is just a test", token=fb_oauth)
#Searching Pages with certain Keywords
pages <- searchPages( string="Kejriwal", token=fb_oauth, n=10)
head(pages$name)
#Extract list of posts from a Facebook page
page <- getPage(page="bbcnews", token=fb_oauth, n=5) 
page$message
#Which of these posts got maximum likes?
summary = page[which.max(page$likes_count),]
summary$likes_count
#Which of these posts got maximum comments?
summary1 = page[which.max(page$comments_count),]
summary1$comments_count
#Which post was shared the most?
summary2 = page[which.max(page$shares_count),]
summary2$shares_count
#Extract a list of users who liked the maximum liked posts
post <- getPost(summary$id[1], token=fb_oauth, comments = FALSE, n.likes=200)
head(post$likes)
#Extract FB comments on a specific post
post <- getPost(page$id[1], token=fb_oauth, n.comments=1000, likes=FALSE)
comments <- post$comments
#fix(comments)
comments$comments_count

