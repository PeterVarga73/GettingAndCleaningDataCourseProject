The R script run_analysis.R creates a modified and summarized data set from the original data collected from the accelerometers from the Samsung Galaxy S smartphone.

Original data source : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

line 3-10: loading data into R

line 12-14: merging training and test data

line 16-21: removing from memory original, unmerged data

line 23-25: Extracting only the measurements on the mean and standard deviation for each measurement

line 27: labeling the data set with descriptive variable names, the variable names are from features.txt (features)

line 30: changing the activity labels to descriptive activity names

line 32-33: setting the variable names to "activity" and "subject"

line 35: merging data tables X, y and subject into one data table: X_y_subject

line 37-39: removing from memory unnecessary data tables (X,y, subject)

line 45: grouping data by activity and by subject

line 47: calculating the average of each variable for each activity and each subject

line 53: supplementing the original variable names with the prefix "Mean-of-"

line 55: saving the data table into "projectdata.txt"

line 57-62: removing from memory unnecessary data tables 






