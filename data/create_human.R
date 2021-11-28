library(plyr)

#Read the table Human development and Gender Inequality
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#Looking at the structure, dimension and summary of both datasets
str(hd)
str(gii)

dim(hd)
dim(gii)

summary(hd)
summary(gii)

#Renaming the variables to shorter names
colnames(hd)[1] <- "hdi"
colnames(hd)[2] <- "cntr"
colnames(hd)[3] <- "dev"
colnames(hd)[4] <- "exbr"
colnames(hd)[5] <- "exed"
colnames(hd)[6] <- "yred"
colnames(hd)[7] <- "natin"
colnames(hd)[8] <- "percap"

colnames(gii)[1] <- "gii"
colnames(gii)[2] <- "cntr"
colnames(gii)[3] <- "gin"
colnames(gii)[4] <- "mmi"
colnames(gii)[5] <- "abr"
colnames(gii)[6] <- "parl"
colnames(gii)[7] <- "edu2F"
colnames(gii)[8] <- "edu2M"
colnames(gii)[9] <- "labF"
colnames(gii)[10] <- "labM"

#Adding two more variables to the gii dataset
gii$edu2R <- gii$edu2F/gii$edu2M 
gii$labR <- gii$labF/gii$labM 

#Create the dataset human by joining the two datasets by the column country
human <- join(gii, hd, by = "cntr", type = "inner")

#Check if the dimensions are correct
dim(human)

#Saving the data
write.csv(human, file = "data/human.csv")