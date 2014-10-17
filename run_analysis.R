
run_analysis <- function()
{
        ## define the data file names need for this project
        ## assume the data files are in the same working directory
        testfile  <- "./X_test.txt"
        trainfile <- "./X_train.txt"
        featuresfile <- "./features.txt"
        
        #1. Merges the training and the test data sets to create one data set
        ##
        ## Read test data - 2947 obs. of 561 variables
        testdata <- read.table(testfile)
        
        ## Read train data - 7352 obs. of 561 variables
        traindata <- read.table(trainfile)
        
        ## Merge train data with test data
        data <- rbind(traindata, testdata)
        
        #2. Extracts only the measurements on the mean and standard deviation for each measurement.
        #3. Uses descriptive activity names to name the activities in the data set
        #4. Appropriately labels the data set with descriptive variable names.
        ## 
        ## Read the features data
        featuresdata <- read.table(featuresfile)
        
        ## get the index of feature names containing "mean()" but exlcude meanFreq()
        indexofmean <- grep("mean", sub("meanFreq", "Freq", featuresdata$V2), fixed=TRUE)
        columnnamesofmean <- grep("mean", sub("meanFreq", "Freq", featuresdata$V2), fixed=TRUE, value=TRUE)
        
        ## get the data for the columns containing "mean()"
        meandata <- data[indexofmean]
        
        ## rename column names with the original feature names
        names(meandata) <- columnnamesofmean
        
        ## get the index of feature names related to "std()" - 33 columns
        indexofstd <- grep("std", featuresdata$V2, fixed=TRUE)
        columnnamesofstd <- grep("std", featuresdata$V2, fixed=TRUE, value=TRUE)
        
        ## get the data for the columns containing "std()"
        stddata <- data[indexofstd]
        
        ## rename column names with the original feature names
        names(stddata) <- columnnamesofstd
        
        ## Merge the mean data and std data into one big data table: - should have 66 columns
        mergedmeastddata <- cbind(meandata,stddata)
        
        #5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        averagedata <- sapply(mergedmeastddata, mean)
        averagedata
        
        ## create a txt file with write.table() using row.names=FALSE 
        ## write.table(averagedata, "./MergedMeanAndStdData.txt", row.names=FALSE)
        
}
