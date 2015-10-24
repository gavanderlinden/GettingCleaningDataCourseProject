# NOTE IMPORTANT 
# The Dataset has to be saved in the same folder
# as the run_analysis.R script.
# In interactive mode, make sure to set the
# working directory to source file location
setwd("UCI HAR Dataset")

# load training data set
X_train <- read.table("train/X_train.txt")
subject_train <- read.table("train/subject_train.txt")
y_train <- read.table("train/y_train.txt")

training_set <- cbind(subject_train, X_train, y_train)

# load testing data set
X_test <- read.table("test/X_test.txt")
subject_test <- read.table("test/subject_test.txt")
y_test <- read.table("test/y_test.txt")

testing_set <- cbind(subject_test, X_test, y_test)

# concatenate training and testing set
data_set <- rbind(training_set, testing_set)

print(dim(data_set))

# load feature names
feature_names <- read.table("features.txt", stringsAsFactors = FALSE)[["V2"]]

# set feature names on data_set
colnames(data_set) <- c("subject", feature_names, "activity")

# extract only mean and standard deviation variables
# since some of the newly assigned variables names
# are duplicates, I first have to remove them
tmp <- data_set[, !duplicated(colnames(data_set))]

# I have opted to extract only the variables with mean()
# or std()
smaller_data_set <- dplyr::select(tmp, matches("mean\\()|std\\()|subject|activity"))

# load activity labels and replace
# numeric values in data_set with strings
activities <- read.table("activity_labels.txt", stringsAsFactors = FALSE)[["V2"]]
smaller_data_set$activity <- plyr::mapvalues(smaller_data_set$activity, 1:6, activities)

# group smaller_data_set by activity and subject
# then calculate the means over the groups
grouped <- dplyr::group_by(smaller_data_set, subject, activity)
dfMeans <- as.data.frame(
    dplyr::summarise_each(grouped, dplyr::funs(mean))
)

# write the newly created tidy data set to a txt file
write.table(dfMeans, "../HARUS_Mean_Std_Only.txt", row.name=F)