#install.packages("rvest")
library(rvest)
tittle1=imdb%>%html_nodes("h4 a")%>%html_text()
tittle1
genre=imdb%>%html_nodes("time+span")%>%html_text()
genre
time=imdb%>%html_nodes("time")%>%html_text()
time
movie<-data.frame(tittle1,genre,time)
movie
movie$time=gsub("min","",movie$time)
movie
movie$time=as.numeric(movie$time)
print(movie)
movie$tittle1[movie$time<90]
movie$tittle1[movie$tittle1=="Horror"]
theatre=imdb%>%html_nodes("#theatres_near_you a")%>%html_text()
theatre
movie_genre=by(movie$time,genre,function(x) mean(x))
barplot(movie_genre,main = "average movie time by genre",xlab = genre,ylab = time,ylim = c(0,200),col=rainbow(5))

