# Getting-and-cleaning-data--Course-project


To create your own copy of data, open the run_analysis script in R and source it. 
It will create a table with the data and store it in file "summarized_by_subject_and_activity.txt" which will 
be stored in your working directory. 

Then open that table by writing next commands in  R command prompt:

>>> data <- read.table("summarized_by_subject_and_activity.txt", header = TRUE) 
>>>View(data)
