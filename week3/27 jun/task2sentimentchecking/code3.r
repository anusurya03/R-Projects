folder="C:\\Users\\hp\\Documents\\task3"
filelist=list.files(path=folder, pattern="*.txt")
filelist
filelist=paste(folder,"\\",filelist,sep="")
filelist
mtext=lapply(filelist,FUN = readLines)
print(mtext)
#mtext=lapply(mtext,FUN = paste,collapse=" ")


corpus1=Corpus(VectorSource(mtext))
