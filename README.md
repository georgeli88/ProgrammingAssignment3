Getting and Cleaning Data Course Project
======================

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How run_analysis.R script works 
1. Assume the following 2 data files are in the current working directory
	* "features.txt"
	* "activity_labels.txt"
2. Assume the following 3 data files are in the sub-directory "test" under the current working directory
	* "X_test.txt"
	* "y_test.txt"
	* "subject_test.txt"
3. Assume the following 3 data files are in the sub-directory "train" under the current working directory
	* "X_train.txt"
	* "y_train.txt"
	* "subject_train.txt"
4. Open R Studio
5. Use setwd("Current_Working_Directory") to set to the working directory
4. Run the following command
	* source("run_analysis.R")
	* run_analysis()

## What is the design of the script
1. Read the test data "X_test.txt" into a test data set called "testdata"
	* There are 2947 obs. of 561 variables.
2. Read the test activity and test subject files 
	* Each one has 2947 obs. of 1 variable
3. Read the train data "X_train.txt" into a train data set called "traindata"
	* There are 7352 obs. of 561 variables.
4. Read the train activity and train subject files 
	* Each one has 7352 obs. of 1 variable
5. Use rbind() to merge the train data set and the test data set to create one data set called "data"
	* The merged data set has 10299 obs of 561 variables
6. Use rbind() to merge the train activity and the test activity to create one data set called "activitydata"
	* The merged activitydata has 10299 obs of 1 variable
	* Rename the variable name to be "Activity"
7. Use rbind() to merge the train subject and the test subject to create one data set called "subjectdata"
	* The merged subjectdata has 10299 obs of 1 variable
	* Rename the variable name to be "Subject"
8. Read the "activity_labels.txt" file to get the activity names
	* Change the activity number to activirt name in the "activitydata" data set
9. Read "features.txt" to extract only the measurements of mean for each measurement
	* There are 33 feature variables containing "mean()" from the 561 variables 
10. Extract only the "mean" data from the merged "data" set into a new data set called "meandata"
11. Rename the column names in "meandata" with the feature names containing "mean()"
	* The "meandata" has 10299 obs of 33 variables 
12. Read "features.txt" to extract only the measurements of standard deviation for each measurement
	* There are 33 feature variables containing "std()" from the 561 variables 
13. Extract only the "std" data from the merged "data" set into a new data set called "stddata"
14. Rename the column names in "stddata" with the feature names containing std()"
	* The "stddata" has 10299 obs of 33 variables 
15. Use cbind() to combine the mean-only measurment data set "meandata" with the standard-deviation-only measurement data set "stddata" and create a new data set called "mergedmeastddata" 
	* The "mergedmeastddata" has 10299 obs of 66 variables.
16. Use cbind() to combine the "mergedmeastddata" with "subjectdata"
	* The "mergedmeastddata" has 10299 obs of 67 variables. 
	* The 67th column is the "Subject"
17. Use cbind() to combine the "mergedmeastddata" with "activitydata"
	* The "mergedmeastddata" has 10299 obs of 68 variables. 
	* The 68th column is the "Activity" name
18. The final data set has 10299 rows and 68 columns
19. Use sapply() to create a 2nd data set "averagedata" with the average of each variable for each activity and each subject
	* The "averagedata"has 180 rows
	* The "averagedata"has 66 columns for 66 variables
	* The first 33 column values are the measurements of mean related
	* The second 33 column valles are the measurements of standard deviation related
20. Use write.table() with row.names=FALSE to create a txt file "MergedMeanAndStdData.txt"


