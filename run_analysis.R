####################################################################
# 1. Merges the training and the test sets to create one data set. #
####################################################################
sub_test<-read.table("test/subject_test.txt")
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
features<-read.table("features.txt")
featureASname<-lapply(features[,2],as.character)

colnames(sub_test)<-c("Subject")
colnames(y_test)<-c("Activity")

#######################################################################
# 4. Appropriately labels the data set with descriptive variable names.
#######################################################################
colnames(x_test)<-featureASname
test_total_data<-cbind(sub_test,y_test,x_test)

sub_train<-read.table("train/subject_train.txt")
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")

colnames(sub_train)<-c("Subject")
colnames(y_train)<-c("Activity")
colnames(x_train)<-featureASname
train_total_data<-cbind(sub_train,y_train,x_train)

total_data<-rbind(test_total_data,train_total_data)

#######################################################################
# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement.
#######################################################################

mean_std_table<-cbind(total_data[,1:2],total_data[,grep("mean",names(total_data))],total_data[,grep("std",names(total_data))])

##########################################################################
# 3. Uses descriptive activity names to name the activities in the data set.
##########################################################################
for (i in 1:nrow(mean_std_table)) {
  value<-mean_std_table[i,2]
  mean_std_table[i,2] <- if (value == 1) {
    "WALKING"
  } else if (value == 2) {
    "WALKING_UPSTAIRS"
  } else if (value == 3) {
    "WALKING_DOWNSTAIRS"
  } else if (value == 4) {
    "SITTING"
  } else if (value == 5) {
    "STANDING"
  } else if (value == 6){
    "LAYING"
  } else {
    "NA"
  }

}

#######################################################################
# 5. From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.
#######################################################################

tidy_table <- aggregate(mean_std_table[,3:ncol(mean_std_table)], list(Subject=mean_std_table$Subject, Activity=mean_std_table$Activity),mean)
write.table(tidy_table, "tidy_table.txt", row.names = FALSE)
