library(data.table)
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, mode="wb", destfile = "accelerometerData.zip")
unzip("accelerometerData.zip")

##first load data that is common to test and training
##The features are the column names
features <- read.table("UCI HAR Dataset\\features.txt")

##Activity labels - walking, standing, etc...
activityLabels <- read.table("UCI HAR Dataset\\activity_labels.txt")
colnames(activityLabels)<- c("Id", "Activity")

##load and evaluate it to see how it needs to be merged
##this file is the labels to link to the activity
testLabel <- read.table("UCI HAR Dataset\\test\\y_test.txt")
ncol(testLabel) ##1
nrow(testLabel) ##2947
##add another column for the activity name
for(i in 1:nrow(testLabel))
{
    testLabel[i,2] <- activityLabels[testLabel[i,1], 2]
}

##better column names
names(testLabel) <- c("Activity_Code", "Activity")

##this file is the results
testSet <- read.table("UCI HAR Dataset\\test\\x_test.txt")
ncol(testSet) ##561
nrow(testSet) ##2947
names(testSet) <- features[,2]

##this file is an identifier for the people
testSubjects <- read.table("UCI HAR Dataset\\test\\subject_test.txt", col.names = "Subject")
ncol(testSubjects) #1
nrow(testSubjects) ##2947



##now get the training data
##this file is the labels to link to the activity
trainLabel <- read.table("UCI HAR Dataset\\train\\y_train.txt")
ncol(trainLabel) ##1
nrow(trainLabel) ##7352
##add another column for the activity name
for(i in 1:nrow(trainLabel))
{
    trainLabel[i,2] <- activityLabels[trainLabel[i,1], 2]
}

##better column names
names(trainLabel) <- c("Activity_Code", "Activity")

##this file is the results
trainSet <- read.table("UCI HAR Dataset\\train\\x_train.txt")
ncol(trainSet) ##561
nrow(trainSet) ##7352
names(trainSet) <- features[,2]

##this file is an identifier for the people
trainSubjects <- read.table("UCI HAR Dataset\\train\\subject_train.txt", col.names = "Subject")
ncol(trainSubjects) #1
nrow(trainSubjects) ##7352

##combine the data -- probably extra steps, but seems to make it clearer on what the steps are
allSubjects <- rbind(testSubjects, trainSubjects)
allActivities <- rbind(testLabel, trainLabel)
subjectsAndActivity <- cbind(allSubjects, allActivities) 
combinedData <- rbind(testSet, trainSet)
##now get the data we actually want
filter <- features[grepl("(mean|std)", features[,2]),]
combinedData <- combinedData[, filter[,1]]
combinedData <- cbind(subjectsAndActivity, combinedData)

#unload some of the data that's not referenced anymore
rm(testSet); rm(trainSet);

library(reshape2)
##to get the averages we need to be able to group the data, which we will do using the melt and dcast functions
datasetIds <- c("Subject", "Activity_Code", "Activity")
datasetVariables <- colnames(combinedData)[4:length(colnames(combinedData))]
meltedDataSet <- melt(combinedData, id = datasetIds, measure.vars = datasetVariables)
averageDataSet <- dcast(meltedDataSet, Subject + Activity_Code + Activity ~ variable, mean)

rm(combinedData)

## write to text
write.table(averageDataSet, file="tidyData.txt", row.name = FALSE)

