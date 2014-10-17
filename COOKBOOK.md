Cook Book for Getting and Cleaning Data Course Project
======================

## Variables names for the data set
### There are 66 variables
### The 1st 33 variables are mean() related
### The 2nd 33 variable are std() related

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
12. tBodyGyro-mean()-13. tBodyGyroJerk-mean()-X      
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
36. tBodyAcc-std()-Z  37. tGravityAcc-std()-X         
38. tGravityAcc-std()-Y         
39. tGravityAcc-std()-Z         
40. tBodyAccJerk-std()-X       
41. tBodyAccJerk-std()-Y        
42. tBodyAccJerk-std()-Z        
43. tBodyGyro-std()-X           
44. tBodyGyro-std()-Y 45. tBodyGyro-std()-Z           
46. tBodyGyroJerk-std()-X       
47. tBodyGyroJerk-std()-Y       
48. tBodyGyroJerk-std()-Z      
49. tBodyAccMag-std()           
50. tGravityAccMag-std()        
51. tBodyAccJerkMag-std()       
52. tBodyGyroMag-std()        53. tBodyGyroJerkMag-std()      
54. fBodyAcc-std()-X            
55. fBodyAcc-std()-Y            
56. fBodyAcc-std()-Z          57. fBodyAccJerk-std()-X        
58. fBodyAccJerk-std()-Y        
59. fBodyAccJerk-std()-Z        
60. fBodyGyro-std()-X         61. fBodyGyro-std()-Y           
62. fBodyGyro-std()-Z           
63. fBodyAccMag-std()           
64. fBodyBodyAccJerkMag-std() 65. fBodyBodyGyroMag-std()      
66. fBodyBodyGyroJerkMag-std() 

## Summary choice
The summary is the result uisng sapply() with the mean() function

## Experimental study design
* Merge the train data and test data into one data set
* Extract the measurements on the mean (mean) and standard deviation (std) for each measurement
* use the mean() function to get the average of each variable
* The first 33 values are the average of the variables related to mean
* The second 33 values are the average of the variables related to standard deviation (std)