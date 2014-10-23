Cook Book for Getting and Cleaning Data Course Project
======================

### Variables names for the data set
There are 68 variables
* The 1st 33 variables (1 - 33) are the measurement of mean related
* The 2nd 33 variables (34 - 66) are the measurements of standard deviation related
* The 67th variable is the Subject ID
* The 68th variable is the Activity name

1. tBodyAcc-mean()-X           
2. tBodyAcc-mean()-Y           
3. tBodyAcc-mean()-Z           
4. tGravityAcc-mean()-X       
5. tGravityAcc-mean()-Y        
6. tGravityAcc-mean()-Z        
7. tBodyAccJerk-mean()-X       
8. tBodyAccJerk-mean()-Y      
9. tBodyAccJerk-mean()-Z     
10. tBodyGyro-mean()-X          
11. tBodyGyro-mean()-Y          
12. tBodyGyro-mean()-Z
13. tBodyGyroJerk-mean()-X      
14. tBodyGyroJerk-mean()-Y      
15. tBodyGyroJerk-mean()-Z      
16. tBodyAccMag-mean()         
17. tGravityAccMag-mean()       
18. tBodyAccJerkMag-mean()      
19. tBodyGyroMag-mean()         
20. tBodyGyroJerkMag-mean()    
21. fBodyAcc-mean()-X           
22. fBodyAcc-mean()-Y           
23. fBodyAcc-mean()-Z           
24. fBodyAccJerk-mean()-X      
25. fBodyAccJerk-mean()-Y       
26. fBodyAccJerk-mean()-Z       
27. fBodyGyro-mean()-X          
28. fBodyGyro-mean()-Y         
29. fBodyGyro-mean()-Z          
30. fBodyAccMag-mean()          
31. fBodyBodyAccJerkMag-mean()  
32. fBodyBodyGyroMag-mean()    
33. fBodyBodyGyroJerkMag-mean() 
34. tBodyAcc-std()-X            
35. tBodyAcc-std()-Y            
36. tBodyAcc-std()-Z  
37. tGravityAcc-std()-X         
38. tGravityAcc-std()-Y         
39. tGravityAcc-std()-Z         
40. tBodyAccJerk-std()-X       
41. tBodyAccJerk-std()-Y        
42. tBodyAccJerk-std()-Z        
43. tBodyGyro-std()-X           
44. tBodyGyro-std()-Y 
45. tBodyGyro-std()-Z           
46. tBodyGyroJerk-std()-X       
47. tBodyGyroJerk-std()-Y       
48. tBodyGyroJerk-std()-Z      
49. tBodyAccMag-std()           
50. tGravityAccMag-std()        
51. tBodyAccJerkMag-std()       
52. tBodyGyroMag-std()        
53. tBodyGyroJerkMag-std()      
54. fBodyAcc-std()-X            
55. fBodyAcc-std()-Y            
56. fBodyAcc-std()-Z          
57. fBodyAccJerk-std()-X        
58. fBodyAccJerk-std()-Y        
59. fBodyAccJerk-std()-Z        
60. fBodyGyro-std()-X         
61. fBodyGyro-std()-Y           
62. fBodyGyro-std()-Z           
63. fBodyAccMag-std()           
64. fBodyBodyAccJerkMag-std() 
65. fBodyBodyGyroMag-std()      
66. fBodyBodyGyroJerkMag-std() 
67. Subject
68. Activity

### Summary choice
1. The summary is the result uisng sapply() with the mean() function
2. The summary has 180 rows and 66 columns (exclude the last 2 columns of Subject and Activity)

### Experimental study design
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