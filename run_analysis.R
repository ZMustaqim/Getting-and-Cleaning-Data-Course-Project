library(plyr)


# [1] Merge the training and test sets into one data set

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# 'x' and 'y' data set
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)


# [2] Extract only on the mean and standard deviation for each measurement


features <- read.table("features.txt")
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, mean_and_std_features]

names(x_data) <- features[mean_and_std_features, 2] # Rename the column name


# [3] Use descriptive activity names to name the activities in the data set


activities <- read.table("activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2] # update values with correct activity names
names(y_data) <- "activity" # correct column name


# [4] Label the data set with descriptive variable names


names(subject_data) <- "subject" # correct column name
all_data <- cbind(x_data, y_data, subject_data)# bind all the data in a single data set


# [5] Create independent tidy data set with the average of each variable
# for each activity and each subject


averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)
