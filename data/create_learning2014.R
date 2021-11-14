# Lenka Dovrakova, 14.11.2021, script for data wrangling (First exercise of week 2 in MOOC course)

# Read data to variable lrn14
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# Dimension of the data lrn14 are stored in lrn_dim
lrn_dim = dim(lrn14)

# Structure of the data lrn14
str(lrn14)

# Access the dplyr library
library(dplyr)

# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

# select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

# select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(lrn14,one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)
# scaling the column attitude
lrn14$attitude <- lrn14$Attitude / 10
# Selecting the column to keep
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")
# New variable learning2014 contains only desired columns
learning2014 <- select(lrn14,one_of(keep_columns))

# select rows where Points from exam is greater than zero
learning2014 <- filter(learning2014, Points > 0)

# Let's check if our variable learning2014 has 166 observations in 7 variables
dim(learning2014)
# Set the working directory to the project folder
setwd("C:/Users/lenkad/OneDrive - University of Eastern Finland/Statistics/IODS-project")
# Save our variable to data folder
write.csv(learning2014, file = "data/learning2014.csv")

# Open the learning2014.csv file and checking the str
learning2014 <- read.csv("data/learning2014.csv",header = TRUE,row.names = 1)
str(learning2014)