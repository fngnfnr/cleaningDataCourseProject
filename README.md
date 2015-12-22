#Getting And Cleaning Data Course Project

##Files Included
README.md  
run_analysis.R  
tidyData.txt  
CodeBook.md  

###run_analysis.R
This file contains the script to download the data, load the data, evaluate it, and filter the data to gather what we are interested in for this assignment. The filter is gathering the columns that have either mean or std in the column name.  The column names were put in from a different file provided in the data.  For more information see the CodeBOok.md.

###tidyData.txt
This is the final dataset created in the script to get the average of each variable for each activity and subject. 

### CodeBook.md
This file contains more specific details about the data.

### The Goal of This Project
1 Merges the training and the test sets to create one data set.  
2 Extracts only the measurements on the mean and standard deviation for each measurement.   
3 Uses descriptive activity names to name the activities in the data set  
4 Appropriately labels the data set with descriptive variable names.   
5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  


### Data Source 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Credit for data source and copyright info
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.


Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

