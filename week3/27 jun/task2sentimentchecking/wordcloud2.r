folder="C:\\Users\\hp\\Documents\\task3"
filelist=list.files(path=folder,pattern = "*.txt")
print(filelist)
filelist=paste(folder,"\\",filelist,sep="")
filelist
mtext=lapply(filelist,FUN = readLines)
mtext
mtext1=lapply(mtext,FUN = paste,collapse=" ")
mtext1=gsub(pattern = "\\W",replacement = " ",mtext1)
mtext1=gsub(pattern = "\\d",replacement = " ",mtext1)
mtext1=tolower(mtext1)
mtext1=removeWords(mtext1,stopwords())
mtext1=gsub(pattern = "\\b[a-z]\\b(1)",replacement = " ",mtext1)
mtext1=stripWhitespace(mtext1)
gt=str_split(pattern = "\\s+",mtext1)
gt
gt=unlist(gt)
corpus1=Corpus(VectorSource(mtext1))
tdm=TermDocumentMatrix(corpus1)
mat=as.matrix(tdm)
mat
comparison.cloud(mat)



pw1=scan("positive-words.txt",what="character",comment.char = ";")

pw2=scan("negative-words.txt",what="character",comment.char = ";")
match(gt,pw1)
p=sum(!is.na(match(gt,pw1)))
p
n=sum(!is.na(match(gt,pw2)))
n
score=p-n
score

