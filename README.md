# Getting-and-cleaning-data--Course-project


To create your own copy of data,download "run_analysis.R" file using Download Zip button,  open it  in R and source it. 
It will create a table with the data and store it in file "summarized_by_subject_and_activity.txt" which will 
be stored in your working directory. 

Then open that table by writing next commands in  R command prompt:

>>> data <- read.table("summarized_by_subject_and_activity.txt", header = TRUE) 
>>>View(data)

The data was created by :
R-Studio Version 0.98.1103 
[64-bit] R-3.2.0

Underneath, you can find tte script with the explanations of what it does.

###downloads and extracts the data if that is not done already

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!dir.exists("Projectdata")) {dir.create ("Projectdata")}
if(!file.exists("./Projectdata/Dataset.zip")) {download.file(url, "./Projectdata/Dataset.zip")}
if(!file.exists("./Projectdata/UCI HAR Dataset")) {unzip("./Projectdata/Dataset.zip",  exdir = "./Projectdata")}

###loads needed packages
library(dplyr)
library(tidyr)



### Collects indices of all variables that have either the word "mean" or the word "std" in their name.
### Then it collects  the indices of all variables containing word "Freq", since those values are derivatives 
### from original data and are not needed. Then it removes those indices from the rest of needed ones.

allvariables <- read.table("./Projectdata/UCI HAR Dataset/features.txt")
index <- grep("std|mean" , allvariables[,2])
notneeded <- grep("Freq", allvariables[,2])
indexneeded <- index[!(index%in%notneeded)]

###  loads the test set data. selects for columns that we need 3. assigns the right column names
testset<- read.table("./Projectdata/UCI HAR Dataset/test/x_test.txt",  colClasses = "numeric")
testset <- testset[,indexneeded]
colnames(testset) <- allvariables[indexneeded,2]

### merges the testset data with the appropriate subject and activity tables
subjecttestset <-   read.table("./Projectdata/UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
testsetactivitylabels <- read.table("./Projectdata/UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
testset_tidy <-cbind(subjecttestset,testsetactivitylabels, testset)


### loads the train set data. selects the same columns as from the test set. assigns the right column names
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

### renames values of the Activity variable to a more descriptive one
namevector <- c("WALKING", "WALKIN_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
for(i in 1:6) {bigdata$Activity <- gsub(i, namevector[i], bigdata$Activity)}

### creates the final data
output <- bigdata %>%
  group_by(Subject,Activity) %>%
  summarise_each(funs(mean)) %>%
  arrange(Subject) 

### creates descriptive column names  for the newly created table
colnames(output) <- gsub ( "\\(|\\)", "", colnames(output))
tidy_names <- vector("character")
for (i in 3:68) {tidy_names[i] <-paste("mean_by_subject_and_activity-",colnames(output[i]),sep="" )}
colnames(output) <-c("Subject", "Activity", tidy_names[3:68])

### creates the table with final data
write.table(output, "summarized_by_subject_and_activity.txt",  row.names = FALSE) 
