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
1. Assume the following 3 data files are in the current working directory
	* "X_test.txt"
	* "X_train.txt"
	* "features.txt"
2. Open R Studio
3. Use setwd("Current_Working_Directory") to set to the working directory
4. Run the following command
	* source("run_analysis.R")
	* run_analysis()

## What is the design of the script
1. Read the test data "X_test.txt" into a test data set called "testdata"
	* There are 2947 obs. of 561 variables.
2. Read the train data "X_train.txt" into a train data set called "traindata"
	* There are 7352 obs. of 561 variables.
3. Use rbind() to merge the train data set and the test data set to create one data set called "data"
	* The merged data set has 10299 obs of 561 variables
4. Read "features.txt" to extract only the measurements of mean for each measurement
	* There are 33 feature variables containing "mean()" from the 561 variables 
5. Extract only the "mean" data from the merged "data" set into a new data set called "meandata"
6. Rename the column names in "meandata" with the feature names containing "mean()"
	* The "meandata" has 10299 obs of 33 variables 
7. Read "features.txt" to extract only the measurements of standard deviation for each measurement
	* There are 33 feature variables containing "std()" from the 561 variables 
8. Extract only the "std" data from the merged "data" set into a new data set called "stddata"
9. Rename the column names in "stddata" with the feature names containing std()"
	* The "stddata" has 10299 obs of 33 variables 
10. Use cbind() to combine the mean-only measurment data set "meandata" with the standard-deviation-only measurement data set "stddata" and create a new data set called "mergedmeastddata" 
	* The "mergedmeastddata" has 10299 obs of 66 variables.
11. Use sapply() to create a 2nd data set "averagedata" with the average of each variable for each activity and each subject
	* The "averagedata"has 66 values for 66 variables
	* The first 33 values are the measurements of mean related
	* The second 33 valles are the measurements of standard deviation related
12. When needed, use write.table() with row.names=FALSE to create a txt file "MergedMeanAndStdData.txt"


