==================================================================
Getting and Cleaning Data Course Project
==================================================================

==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================
- A 66-feature vector with calculated average time and frequency domain variables obtained from Triaxial acceleration from the accelerometer and Triaxial Angular velocity from the gyroscope. 
- Its six activity labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). 
- An identifier of 30 subjects who carried out the experiment.

This project includes the following files:
=========================================

- 'README.txt'

- 'codebook.md': Code book list and describe all variables, the data, and any transformations or work performed to clean up train/test dataset to produce tidy data 'alldatac' dataset with verage of each variable for each activity and each subjec 

- 'run_analysis.R': R script that performs following steps:

	1) Merged the training ('train/X_train.txt', 'train/y_train.txt', 'train/subject_train.txt') and the test ('test/X_test.txt', 'test/y_test.txt', 'test/subject_test.txt') sets to create one data set.
	2) Extracted only the measurements on the mean() and std() for each measurement using 'features.txt' with all the features names.
	3) Added descriptive activity names to name the activities in the data set by merging 'activity_labels.txt' to the merged dataset in step 1)
	4) Labelled variables names with describptive names from 'features.txt' and changed the names to low case variable names and removing special characters such as -(). Changed "prefix t' to 'time' and 'prefix f' to 'freq'
	5) From the data set in step 4, created a second, independent tidy data set 'alldatac' with the average of each variable for each activity and each subject.

- 'alldatax.txt': Independent tidy data set with the average of each variable for each activity and each subject.
The following files are used from the train and test data

- 'features.txt': List of all features.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'activity_labels.txt': Links the class labels with their activity name.

Notes: 
======
- Average value of each feature vector for each subject by activity is a row on the data frame alldatac.


License:
========
Acknowledgement:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
