#Code Book

##Activity Codes and Descriptions
1 WALKING  
2 WALKING_UPSTAIRS  
3 WALKING_DOWNSTAIRS  
4 SITTING  
5 STANDING  
6 LAYING  

##Columns used for the mean and standard deviation variables
All columns that contained mean or std in the names.  
The column names were combined into the data from the features.txt file included with the data download.

## Subjects
The subjects are the participants that provided the data.  The subjects are found in the subject_train.txt and subject_test.txt files included in the data download.  


More specific information about how the data was gathered can be found in features_info.txt included in the data download.

##Data transformation and gathering
The data for this project was gathered from multiple files split into groups of test and training subjects.  The files that were imported included the data results, the subject identifier, and the activity code.  The data was loaded then combined to make a dataset that contained the test and training data with more descriptive columns and with the activity name instead of just the code. 

The data was then filtered to only include columns for the mean and standard deviation by looking for column names that had mean or std in the name.  These columns are the variables.  There were 3 other columns left in place as identifiers for the data.  They are Subject, Activity_Code and Activity.  

Using the merge and dcast functions the combined dataset was used to create another tidy dataset that contains the average of each variable grouped by the identifiers previously mentioned.  This average dataset was then written to file tidyData.txt


### Credit for data source and copyright info
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.


Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.