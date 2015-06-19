# Getting-and-cleaning-data--Course-project


To create your own copy of data,download "run_analysis.R" file,  open it  in R and source it. 
It will create a table with the data and store it in file "summarized_by_subject_and_activity.txt" which will 
be stored in your working directory. 

Then open that table by writing next commands in  R command prompt:

>>> data <- read.table("summarized_by_subject_and_activity.txt", header = TRUE) 
>>>View(data)

The data was created by :
R-Studio Version 0.98.1103 
[64-bit] R-3.2.0
