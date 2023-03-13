library(readxl)
Data <- read_excel("Property_Value_Analyser.xlsx")

Data
View(Data)

#track id is made primary key
file1 <- Data[ , c(1:4)]
file2 <- Data[ , c(1,4:7)]
file3 <- Data[ , c(7:10)]
file4 <- Data[ , c(7,9:11)]
file5 <- Data[ , c(1,12)]

View(file1)
View(file2)
View(file3)
View(file4)
View(file5)

#feature reduction i.e. removing unnecessary columns
file4 <- subset(file4, select = - Number_of_Records)
file4

#finding number of NAs in the columns
colSums(is.na(file1))
colSums(is.na(file2))
colSums(is.na(file3))
colSums(is.na(file4))
colSums(is.na(file5))

#removing rows having Zipcode and Property_Type equal to NAs
file2 <- file2[!is.na(file2$Property_Type), ]
file2 <- file2[!is.na(file2$Zipcode), ]

file3 <- file3[!is.na(file3$Zipcode), ]
file4 <- file4[!is.na(file4$Zipcode), ]

#replacing NAs in the beds and Reviews Ratings With their Mean
beds <- file3$Beds[!is.na(file3$Beds)]
mean_bed = mean(beds)
file3$Beds[is.na(file3$Beds)] <- ceiling(mean_bed)

Ratings <- file5$Review_Scores_Rating[!is.na(file5$Review_Scores_Rating)]
mean_Rating <- mean(Ratings)
file5$Review_Scores_Rating[is.na(file5$Review_Scores_Rating)] <- ceiling(mean_Rating)

#After Preprocessing 
colSums(is.na(file1))
colSums(is.na(file2))
colSums(is.na(file3))
colSums(is.na(file4))
colSums(is.na(file5))

#writing the datasets into csv files
write.csv(file1,"file1.csv", row.names = TRUE)
write.csv(file2,"file2.csv", row.names = TRUE)
write.csv(file3,"file3.csv", row.names = TRUE)
write.csv(file4,"file4.csv", row.names = TRUE)
write.csv(file5,"file5.csv", row.names = TRUE)

read.csv("file1.csv")
read.csv("file2.csv")
read.csv("file3.csv")
read.csv("file4.csv")
read.csv("file5.csv")