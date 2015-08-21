# Getting-and-Cleaning-Data-Course-Project


##run_analysis.R
###run_analysis.R script does the following:
* [1] Merge the training and test sets into one data setExtracts only the measurements on the mean and standard deviation for each measurement. 
* [2] Extract only on the mean and standard deviation for each measurement
* [3] Use descriptive activity names to name the activities in the data set
* [4] Label the data set with descriptive variable names
* [5] Create independent tidy data set with the average of each variable for each activity and each subject

###Cleaned Data
The resulting clean dataset is in this repository at: averages_data.txt. It contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation from the original dataset.
