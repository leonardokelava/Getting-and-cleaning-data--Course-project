

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!dir.exists("Projectdata")) {dir.create ("Projectdata")}
if(!file.exists("./Projectdata/Dataset.zip")) {download.file(url, "./Projectdata/Dataset.zip")}
if(!file.exists("./Projectdata/UCI HAR Dataset")) {unzip("./Projectdata/Dataset.zip",  exdir = "./Projectdata")}

library(dplyr)
library(tidyr)

allvariables <- read.table("./UCI HAR Dataset/features.txt")
index <- grep("std|mean" , allvariables[,2])
notneeded <- grep("Freq", allvariables[,2])
indexneeded <- index[!(index%in%notneeded)]

testset<- read.table("./UCI HAR Dataset/test/x_test.txt",  colClasses = "numeric")
testset <- testset[,indexneeded]
colnames(testset) <- allvariables[indexneeded,2]

subjecttestset <-   read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
testsetactivitylabels <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
testset_tidy <-cbind(subjecttestset,testsetactivitylabels, testset)

trainset <- read.table("./UCI HAR Dataset/train/x_train.txt",  colClasses = "numeric")
trainset <-trainset[,indexneeded]
colnames(trainset) <- allvariables[indexneeded,2]

subjecttrainset <-   read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
trainsetlabels <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
trainset_tidy <-cbind(subjecttrainset,trainsetlabels, trainset)

bigdata <- rbind(testset_tidy, trainset_tidy)
bigdata <- arrange(bigdata,Subject)

namevector <- c("WALKING", "WALKIN_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
for(i in 1:6) {bigdata$Activity <- gsub(i, namevector[i], bigdata$Activity)}

output <- bigdata %>%
  group_by(Subject,Activity) %>%
  summarise_each(funs(mean)) %>%
  arrange(Subject) 

colnames(output) <- gsub ( "\\(|\\)", "", colnames(output))
tidy_names <- vector("character")
for (i in 3:68) {tidy_names[i] <-paste("mean_by_subject_and_activity-",colnames(output[i]),sep="" )}
colnames(output) <-c("Subject", "Activity", tidy_names[3:68])

write.table(output, "summarized_by_subject_and_activity.txt",  row.names = FALSE) 
