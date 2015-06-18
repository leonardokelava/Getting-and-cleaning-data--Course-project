###downloads and extracts data if that is not done already

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!dir.exists("Projectdata")) {dir.create ("Projectdata")}
if(!file.exists("./Projectdata/Dataset.zip")) {download.file(url, "./Project data/Dataset.zip")}
if(!file.exists("./Projectdata/UCI HAR Dataset")) {unzip("./Projectdata/Dataset.zip",  exdir = "./Projectdata")}

###loads needed packages
library(dplyr)
library(tidyr)



### collects all variables that have either the word "mean" or the word "std" in their name 
allvariables <- read.table("./Projectdata/UCI HAR Dataset/features.txt")
index <- grep("std|mean" , allvariables[,2])
notneeded <- grep("Freq", allvariables[,2])
indexneeded <- index[!(index%in%notneeded)]

### by lines 1. loads the test set data 2. selects for columns that contain std or mean values  3. assigns the right column names
testset<- read.table("./Projectdata/UCI HAR Dataset/test/x_test.txt",  colClasses = "numeric")
testset <- testset[,indexneeded]
colnames(testset) <- allvariables[indexneeded,2]

### merges the testset data with the appropriate subject and activity tables
subjecttestset <-   read.table("./Projectdata/UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
testsetactivitylabels <- read.table("./Projectdata/UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
testset_tidy <-cbind(subjecttestset,testsetactivitylabels, testset)


### by lines 1. loads the train set data 2. selects the same columns as from the test set 3. assigns the right column names
trainset <- read.table("./Projectdata/UCI HAR Dataset/train/x_train.txt",  colClasses = "numeric")
trainset <-trainset[,indexneeded]
colnames(trainset) <- allvariables[indexneeded,2]

### merges the trainset data with the appropriate subject and activity tables
subjecttrainset <-   read.table("./Projectdata/UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
trainsetlabels <- read.table("./Projectdata/UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
trainset_tidy <-cbind(subjecttrainset,trainsetlabels, trainset)


###merges test set and train set data into one big column
bigdata <- rbind(testset_tidy, trainset_tidy)
bigdata <- arrange(bigdata,Subject)

### renames values of the Activity variable

namevector <- c("WALKING", "WALKIN_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
for(i in 1:6) {bigdata$Activity <- gsub(i, namevector[i], bigdata$Activity)}




output <- bigdata %>%
  group_by(Subject,Activity) %>%
  summarise_each(funs(mean)) %>%
  arrange(Subject) 
  

write.table(output, "assignmet.txt",  row.names = FALSE) 
