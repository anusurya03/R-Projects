#Simple Web Scraping using R
install.packages("rvest")
library(rvest)
#Reading HTML Pages
imdb = read_html("http://www.imdb.com/movies-in-theaters/")
print(imdb)
?html_nodes
#Fetching Titles
titles = imdb%>%html_nodes("h4 a")%>%html_text()
print(titles)
genre = imdb%>%html_nodes("time+ span")%>%html_text()
print(genre)
time = imdb%>%html_nodes("time")%>%html_text()
print(time)
#convert into DataFrame
imdb_table = data.frame(titles,genre,time)
print(imdb_table)
#Removing "min" from time
imdb_table$time = gsub("min","",imdb_table$time)
#Making it Numeric
imdb_table$time = as.numeric(imdb_table$time)
print(imdb_table)
#Running Some Queries
#Q1. Pick movie shorter than 90 min
imdb_table$titles[imdb_table$time<90]
#Q2. Pick All movies of Genre Horror
imdb_table$titles[imdb_table$genre == 'Horror']

#Picking Theatres Near Me
theatre = imdb%>%html_nodes("#theaters_near_you a")%>%html_text()
print(theatre)


#Plotting Barplot of average movie length for each genre
movietime_genre = by(imdb_table$time,genre,function(x) mean(x))
print(movietime_genre)
barplot(movietime_genre, main="Average Movie Time By Genre", xlab="Genre", ylab="Time(Minutes)", col = rainbow(8))
