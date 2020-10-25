# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names.
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
library(data.table)
library(dplyr)
library(reshape2)
setwd("C:\\Vineet-Learning\\Data Science\\Course 3- Getting-and-cleaning-data\\assignment")

# 1) Merges the training and the test sets to create one data set.
# Read variables names from features.txt to associate with the variable names in C_train and X_test data
feature <- fread("./data/UCI HAR Dataset/features.txt")

# Read subject, measurements and activity data from train files
X_train <- fread("./data/UCI HAR Dataset/train/X_train.txt", col.names =feature$V2)
str(X_train)
y_train <- fread("./data/UCI HAR Dataset/train/y_train.txt", col.names = c("classlabel"))
str(y_train)
subject_train <- fread("./data/UCI HAR Dataset/train/subject_train.txt", col.names = c("subjectid"))
str(subject_train)
# Merge training datasets
training<-cbind(subject_train,y_train, X_train)
str(training)

# Read subject, measurements and activity data from test files
X_test <- fread("./data/UCI HAR Dataset/test/X_test.txt", col.names =feature$V2)
str(X_test)
y_test <- fread("./data/UCI HAR Dataset/test/y_test.txt", col.names = c("classlabel"))
str(y_test)
subject_test <- fread("./data/UCI HAR Dataset/test/subject_test.txt", col.names = c("subjectid"))
str(subject_test)
# Merge testing datasets
test<-cbind(subject_test,y_test, X_test)
str(test)

# Combine training and test data 
alldata<-rbind(training,test)
str(alldata)

# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
# Get variable names and use grep function to extract variable names with mean() and std()
alldatanames<-names(alldata)
subnames<-grep("subject|classlabel|mean\\(\\)|std\\(\\)", alldatanames,value=TRUE)
subnames
alldata<-select(alldata, subnames)


# 3) Uses descriptive activity names to name the activities in the data set
# Read activity_labels.txt to link the class labels with their activity name
activity_labels <- fread("./data/UCI HAR Dataset/activity_labels.txt", col.names =c("classlabel", "activityname"))
# Merge combined train and test data with activity label to get the name of descriptive activites
alldata<-merge(alldata, activity_labels, by=c("classlabel"))

# 4) Appropriately labels the data set with descriptive variable names.
# Added descriptive variables in step#1 from feature.txt
# Low case variable names and remove special characters such as -() from the variable names to tidy up the datasets
descvars<-tolower(gsub("[-|(|)!,]", "", names(alldata)))
descvars<-gsub("^t","time",descvars)
descvars<-gsub("^f","freq",descvars)
descvars
names(alldata)<-descvars
str(alldata)

# 5) From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
# melt data 
alldatam<-melt(alldata, id=c("subjectid", "classlabel", "activityname"), na.rm=TRUE)
## Casting data frames with average of each variable for each activity and each subject
alldatac<-reshape2::dcast(alldatam, subjectid+activityname~ variable, mean)
alldatac