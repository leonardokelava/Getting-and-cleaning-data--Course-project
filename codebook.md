This document consists of three parts. 

First part is the short version of the document made by Smartlab group which describes their experiment. 
A full description is available at the site where the data was obtained from: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Second part is short description of all the variables they used in their original data.
Here are the original data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You can download the data and unzip it to your working directory yourself. 
Preferably, you could  source run_analysis.R and  the program will download the data by itself ,
it will unzip it to your working directory and it will then  perform  analysis on it,
creating a text document "summarized_by_subject_and_activity.txt"

The file "features_info.txt", within the zip file, contains detailed information about original signals and the variables that were created upon them. Run_analysis.R program takes the calcukated means and standard deviations for the signals, and then calculates their means, summarized for each subject and activity.    

Third part contains comprehensive list of variables that are created by run_analysis script.   

Part 1.


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on
 the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two 
sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 
variables from the time and frequency domain. See 'features_info.txt' for more details. 

Part 2.
For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Part 3.

Run_analysis creates a table with 68 variables shown below. 
Subject is a ID of a person who performed the activity. Its values ranges from 1 to 30.
Activity is a categoric variable that describes the activity performed. 
The rest of values are means of  standard deviations and means calculated for each subject and activity.  
Their names are derived by adding string  "mean_by_subject_and_activity" in front of the original value for which
mean was calculated. 
Each row has  summary means by one subject and by one activity measured for each variable. 
This is comprehensive list of all variables. 

Subject

Activity

mean_by_subject_and_activity-tBodyAcc-mean-X

mean_by_subject_and_activity-tBodyAcc-mean-Y

mean_by_subject_and_activity-tBodyAcc-mean-Z

mean_by_subject_and_activity-tBodyAcc-std-X

mean_by_subject_and_activity-tBodyAcc-std-Y

mean_by_subject_and_activity-tBodyAcc-std-Z

mean_by_subject_and_activity-tGravityAcc-mean-X

mean_by_subject_and_activity-tGravityAcc-mean-Y

mean_by_subject_and_activity-tGravityAcc-mean-Z

mean_by_subject_and_activity-tGravityAcc-std-X

mean_by_subject_and_activity-tGravityAcc-std-Y

mean_by_subject_and_activity-tGravityAcc-std-Z

mean_by_subject_and_activity-tBodyAccJerk-mean-X

mean_by_subject_and_activity-tBodyAccJerk-mean-Y

mean_by_subject_and_activity-tBodyAccJerk-mean-Z

mean_by_subject_and_activity-tBodyAccJerk-std-X

mean_by_subject_and_activity-tBodyAccJerk-std-Y

mean_by_subject_and_activity-tBodyAccJerk-std-Z

mean_by_subject_and_activity-tBodyGyro-mean-X

mean_by_subject_and_activity-tBodyGyro-mean-Y

mean_by_subject_and_activity-tBodyGyro-mean-Z

mean_by_subject_and_activity-tBodyGyro-std-X

mean_by_subject_and_activity-tBodyGyro-std-Y

mean_by_subject_and_activity-tBodyGyro-std-Z

mean_by_subject_and_activity-tBodyGyroJerk-mean-X

mean_by_subject_and_activity-tBodyGyroJerk-mean-Y

mean_by_subject_and_activity-tBodyGyroJerk-mean-Z

mean_by_subject_and_activity-tBodyGyroJerk-std-X

mean_by_subject_and_activity-tBodyGyroJerk-std-Y

mean_by_subject_and_activity-tBodyGyroJerk-std-Z

mean_by_subject_and_activity-tBodyAccMag-mean

mean_by_subject_and_activity-tBodyAccMag-std

mean_by_subject_and_activity-tGravityAccMag-mean

mean_by_subject_and_activity-tGravityAccMag-std

mean_by_subject_and_activity-tBodyAccJerkMag-mean

mean_by_subject_and_activity-tBodyAccJerkMag-std

mean_by_subject_and_activity-tBodyGyroMag-mean

mean_by_subject_and_activity-tBodyGyroMag-std

mean_by_subject_and_activity-tBodyGyroJerkMag-mean

mean_by_subject_and_activity-tBodyGyroJerkMag-std

mean_by_subject_and_activity-fBodyAcc-mean-X

mean_by_subject_and_activity-fBodyAcc-mean-Y

mean_by_subject_and_activity-fBodyAcc-mean-Z

mean_by_subject_and_activity-fBodyAcc-std-X

mean_by_subject_and_activity-fBodyAcc-std-Y

mean_by_subject_and_activity-fBodyAcc-std-Z

mean_by_subject_and_activity-fBodyAccJerk-mean-X

mean_by_subject_and_activity-fBodyAccJerk-mean-Y

mean_by_subject_and_activity-fBodyAccJerk-mean-Z

mean_by_subject_and_activity-fBodyAccJerk-std-X

mean_by_subject_and_activity-fBodyAccJerk-std-Y

mean_by_subject_and_activity-fBodyAccJerk-std-Z

mean_by_subject_and_activity-fBodyGyro-mean-X

mean_by_subject_and_activity-fBodyGyro-mean-Y

mean_by_subject_and_activity-fBodyGyro-mean-Z

mean_by_subject_and_activity-fBodyGyro-std-X

mean_by_subject_and_activity-fBodyGyro-std-Y

mean_by_subject_and_activity-fBodyGyro-std-Z

mean_by_subject_and_activity-fBodyAccMag-mean

mean_by_subject_and_activity-fBodyAccMag-std

mean_by_subject_and_activity-fBodyBodyAccJerkMag-mean

mean_by_subject_and_activity-fBodyBodyAccJerkMag-std

mean_by_subject_and_activity-fBodyBodyGyroMag-mean

mean_by_subject_and_activity-fBodyBodyGyroMag-std

mean_by_subject_and_activity-fBodyBodyGyroJerkMag-mean

mean_by_subject_and_activity-fBodyBodyGyroJerkMag-std
