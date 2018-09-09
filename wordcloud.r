install.packages("tm")

packages <- c("tm","SnowballC","wordcloud","RColorBrewer") 
to_install <- packages[!(packages %in% library()$results[,1])]
if (length(to_install)>0)
  
  {
  
  install.packages(to_install)
}
lapply(packages, library, character.only=TRUE)

# Read the text file from internet
filePath <- "https://github.com/ryanmcdermott/trump-speeches/blob/master/speeches.txt"
text <- readLines(filePath)

#Create a corpus
corp <- Corpus(VectorSource(text))

#Transform into a plain text document
corp <- tm_map(corp, PlainTextDocument)

#Remove punctuations and stopwords
corp <- tm_map(corp, removePunctuation)
corp <- tm_map(corp, removeWords, c("this","the",stopwords('english')))

#Stemming
corp <- tm_map(corp, stemDocument)


wordcloud(jeopCorpus,
          max.words=200, random.order=FALSE,rot.per = 0.35,
          colors=brewer.pal(8, "Dark2"))
