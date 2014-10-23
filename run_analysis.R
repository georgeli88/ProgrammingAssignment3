
run_analysis <- function()
{
        ## define the data file names need for this project
        ## assume the data files are in the same working directory and "test" and "train" sub-directories
        featuresfile <- "./features.txt"
        activityfile <- "./activity_labels.txt"
        
        testfile  <- "./test/X_test.txt"
        testactivity <- "./test/y_test.txt"
        testsubject <- "./test/subject_test.txt"

        trainfile <- "./train/X_train.txt"
        trainactivity <- "./train/y_train.txt"
        trainsubject <- "./train/subject_train.txt"
        
        #1. Merges the training and the test data sets to create one data set
        ##
        ## Read test data (2947 obs. of 561 variables), activity, and subject files
        testdata <- read.table(testfile)
        testactivitydata <- read.table(testactivity)
        testsubjectdata <- read.table(testsubject)
        
        ## Read train data (7352 obs. of 561 variables), activity, and subject files
        traindata <- read.table(trainfile)
        trainactivitydata <- read.table(trainactivity)
        trainsubjectdata <- read.table(trainsubject)
        
        ## Merge train data with test data to have one data set: 10299 rows & 561 columns
        data <- rbind(traindata, testdata)
        
        ## Merge the train activity with the test activity data - 10299 rows & 1 column
        ## Rename the column as "Activity": 10299 rows & 1 column
        activitydata <- rbind(trainactivitydata, testactivitydata)
        names(activitydata) <- c("Activity")
        
        ## Merge the train subject with the test subject data - 10299 rows & 1 column
        ## Rename the column as "Subject"
        subjectdata <- rbind(trainsubjectdata, testsubjectdata)
        names(subjectdata) <- c("Subject")
        
        #3. Uses descriptive activity names to name the activities in the data set
        ##
        ## Read the activity names
        activitynames <- read.table(activityfile)
        
        ## Replace the activity number (1..6) with activity names in "activitydata" file
        for (k in 1:nrow(activitynames)) 
        {
                activitydata[as.character(activitydata$Activity)==as.character(activitynames$V1[k]),] <- as.character(activitynames$V2[k])
        }
        
        #2. Extracts only the measurements on the mean and standard deviation for each measurement.
        ##
        ## Read the features data
        featuresdata <- read.table(featuresfile)
        
        #4. Appropriately labels the data set with descriptive variable names.
        ## 
        ## get the index of feature names containing "mean()" but exlcude meanFreq()
        indexofmean <- grep("mean", sub("meanFreq", "Freq", featuresdata$V2), fixed=TRUE)
        columnnamesofmean <- grep("mean", sub("meanFreq", "Freq", featuresdata$V2), fixed=TRUE, value=TRUE)
        
        ## get the data for the columns containing "mean()" from the merged oen data set 
        ## rename column names with the original feature names - 10299 rows and 33 columns
        meandata <- data[indexofmean]
        names(meandata) <- columnnamesofmean
        
        ## get the index of feature names related to "std()" - 33 columns
        indexofstd <- grep("std", featuresdata$V2, fixed=TRUE)
        columnnamesofstd <- grep("std", featuresdata$V2, fixed=TRUE, value=TRUE)
        
        ## get the data for the columns containing "std()" from the merged oen data set
        ## rename column names with the original feature names -  - 10299 rows and 33 columns
        stddata <- data[indexofstd]
        names(stddata) <- columnnamesofstd
        
        ## Merge the mean data and std data into one big data table: - 1029 rows & 66 columns
        mergedmeanstddata <- cbind(meandata,stddata)
        
        ## Add the Subject column to the merged data - which is the 67th column
        mergedmeanstddata <-cbind(mergedmeanstddata, subjectdata)
        
        ## Add the Activity column to the merged data - which is the 68th column
        mergedmeanstddata <- cbind(mergedmeanstddata, activitydata)
        
        ## The mergedmeanstddata has 10299 rows and 68 columns after step 4
        ## Column 1-33: measurements for mean()
        ## Column 34- 66: measurements for std()
        ## Column 67: Subject
        ## Column 68: Activity
        
        
        #5. From the data set in step 4, 
        ##  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        ## 
        ## The second data set will have 180 rows and 66 columns
        for (k in 1:nrow(activitynames))
        {
                for (j in 1:30)
                {
                        ## extract the data set for Activity[k] & Subject[j]
                        extracteddata <- mergedmeanstddata[as.character(mergedmeanstddata$Activity)==as.character(activitynames$V2[k]) & as.character(mergedmeanstddata$Subject)==as.character(j),]
                        
                        ## remove the last 2 columns to get the average data
                        if (k==1 & j==1) {
                                averagedata <- sapply(extracteddata[, 1:66], mean) 
                        }
                        else {
                                averagedata <- rbind(averagedata, sapply(extracteddata[, 1:66], mean) )
                        } 
                }
        }
        
        ## create a txt file with write.table() using row.names=FALSE 
        write.table(averagedata, "./MergedMeanAndStdData.txt", row.names=FALSE)
        
}
