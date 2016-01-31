# Description
* This file is one of the expected output of the assignment of the Course: Getting and Cleaning Data provided by Coursera.
* This file is for explain the work flow of the run_analysis.R in detail. 

# Installation and execution of run_analysis.R
1. Using install.packages("data.table") to install this package which will be used in this function.
2. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract the files into the R working directory. The structure should be like "<your R working directory>\UCI HAR Dataset".
3. Place run_analysis.R into the R working directory and directly run it in RStudio or R.

# Workflow of run_analysis.R
1. Generate the first column of subject with the header "subjectid".
2. Generate the second column of activities with the header "activity".
3. Select Features only related to mean and standard deviation for each measurement.
4. Merge test and train data with selected features.
5. Generate the formatted header of the combined data set with test and train data.
6. Generate the merged tidy data txt file.
7. Creates the independent tidy data set with the average of each variable for each activity and each subject.

# Format the features lable on data set.
1. Remove "()"
2. Remove "-"
3. Change "Acc" to "accelerometer" for descritive purpose.
4. Change "Gyro" to "gyroscope" for descritive purpose.
5. Make all characters to lower cases.
