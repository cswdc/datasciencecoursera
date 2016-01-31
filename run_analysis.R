run_analysis <- function(){ 
  
  # Generate the first column of subject with the header "subjectid".
  subjectTest = read.table("UCI HAR Dataset/test/subject_test.txt")
  subjectTrain = read.table("UCI HAR Dataset/train/subject_train.txt") 
  subject <- rbind(subjectTest, subjectTrain) 
  names(subject) <- "subjectid" 
  
  # Generate the second column of activities with the header "activity".
  yTest <- read.table("UCI HAR Dataset/test/Y_test.txt")
  yTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
  activity <- rbind(yTest, yTrain)
  names(activity) <- "activityid"
  activityLables <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activityid", "activityContents"))
  activityLables$activityContents <- tolower(gsub("_", "", as.character(activityLables$activityContents)))
  activity <- merge(activity, activityLables, by="activityid")$activityContents
  
  # Select Features only related to mean and standard deviation for each measurement.
  features <- read.table("UCI HAR Dataset/features.txt", col.names=c("featureid", "featureContent"))  
  selectedFeatures <- grep("-mean\\(\\)|-std\\(\\)", features$featureContent)
  
  # Merge test and train data with selected features.
  xData <- rbind(xTest, xTrain)
  xData <- xData[,selectedFeatures]
  
  # Generate the formatted header of the combined data set with test and train data.
  tmpSelectedFeatures <- features$featureContent[selectedFeatures]
  tmpSelectedFeatures <- gsub("Acc", "accelerometer", tmpSelectedFeatures)
  tmpSelectedFeatures <- gsub("Gyro", "gyroscope", tmpSelectedFeatures)
  tmpSelectedFeatures <- gsub("\\(|\\)", "", tmpSelectedFeatures)
  tmpSelectedFeatures <- gsub("-", "", tmpSelectedFeatures)
  tmpSelectedFeatures <- tolower(tmpSelectedFeatures)
  names(xData) <- tmpSelectedFeatures
  
  # Generate the merged tidy data txt file.
  mergedTidyData <- cbind(subject, activity, xData)
  write.table(mergedTidyData, "merged_tidy_data.txt")
  
  # Creates the independent tidy data set with the average of each variable for each activity and each subject.
  library(data.table) 
  mergedTidyDataDT <- data.table(mergedTidyData) 
  calculatedTidyData<- mergedTidyDataDT[, lapply(.SD, mean), by=c("subjectid", "activity")]  
  write.table(calculatedTidyData, "calculated_tidy_data.txt", row.names = F) 
 
}
