User1<-read.csv("User1data.csv",header = TRUE)
User2<-read.csv("User2data.csv",header = TRUE)
User3<-read.csv("User3data.csv",header = TRUE)
User4<-read.csv("User4data.csv",header = TRUE)
User5<-read.csv("User5data.csv",header = TRUE)

# Function to extract string in bracket
extract<-function(x)
{
  s1<-gsub("[\\(\\)]", "", regmatches(x, gregexpr("\\(.*?\\)", x))[[1]])
  noquote(s1)
}
User1$Recommended<-sapply(User1$Recommended,extract)

# Function to extract String after Capital letter
extract1<-function(x1)
{
  s1<-trimws(gsub("[[:alpha:]][a-z]+|[a-z][[:alpha:]]+", "", x1))
  noquote(s1)
}
User1$Selected<-sapply(User1$Selected,extract1)
User2$Selected<-sapply(User2$Selected,extract1)
User3$Selected<-sapply(User3$Selected,extract1)
User4$Selected<-sapply(User4$Selected,extract1)
User5$Selected<-sapply(User5$Selected,extract1)
User2$Recommended<-sapply(User2$Recommended,extract1)
User3$Recommended<-sapply(User3$Recommended,extract1)
User4$Recommended<-sapply(User4$Recommended,extract1)
User5$Recommended<-sapply(User5$Recommended,extract1)

library("xlsx")
# To write the first data set in a new workbook
write.xlsx(User1, file = "User1.xlsx",
           sheetName = "User1", append = FALSE)

write.xlsx(User2, file = "User2.xlsx", 
           sheetName="User2", append=FALSE)

write.xlsx(User3, file = "User3.xlsx",
           sheetName = "User3", append = FALSE)

write.xlsx(User4, file = "User4.xlsx", 
           sheetName="User4", append=FALSE)

write.xlsx(User5, file = "User5.xlsx", 
           sheetName="User5", append=FALSE)