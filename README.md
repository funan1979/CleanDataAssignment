# CleanDataAssignment
Final assignment for Geting and Cleaning data course
The script read in subject_text.txt which contain only subject index and y_test.txt which is a list of activities, as well as X_test.txt which is a data frame of measured data of different features. Besides, the featue names were also read in and assigned as variable names of the data frame as required by task 4. 
Then cbind command was used to combine Subject, Activity and measured data into one data frame. Same procedure was applied also for "train" data, then two new tables were combined by rbind() commond as required by task 1.
For task 2, "grep" variable names with "mean" and "std", generate a new data frame with only those "mean" and "std" variable as well as Subject and Activity of course.
"For" loop was used to screen each measurement and replace "Activity" number with descriptive activity names as required by task 3. (I think there should be better ways to do this in stead of "for" loop...)
Finally aggregate() command was applied to calculate mean value of each subject and each activity as level parameters.
