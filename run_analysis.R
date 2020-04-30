##reading features and activity data
features <- read.table("features.txt",header=FALSE)
activities <- read.table("activity_labels.txt")
## train data
x_train<-read.table("X_train.txt")
colnames(x_train) <- features$V2 
y_train<-read.table("y_train.txt")
x_train$activity<-y_train$V1
subject_train <- read.table("subject_train.txt") 
x_train$subject <- factor(subject_train$V1)
train<-x_train
################ test
x_test<-read.table("X_test.txt")
colnames(x_test) <- features$V2
y_test<-read.table("y_test.txt")
x_test$activity <- y_test$V1
subject_test <- read.table("subject_test.txt")
x_test$subject <- factor(subject_test$V1)
test<-x_test
####### merge
dataset <- rbind(test, train)
#filter column names
column_names <- colnames(dataset)
#get only columns for standard deviation and mean values, also saves activity and subject values 
library(reshape2)
column_names_filtered <- grep("std\\(\\)|mean\\(\\)|activity|subject", column_names, value=TRUE)
dataset_filtered <- dataset[ , column_names_filtered] 
dataset_filtered$activitylabel <- factor(dataset_filtered$activity, labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
features_colnames = grep("std\\(\\)|mean\\(\\)", column_names, value=TRUE)
dataset.melt <-melt(dataset_filtered, id = c('activitylabel', 'subject'), measure.vars = features_colnames)
dataset.tidy <- dcast(dataset.melt, activitylabel + subject ~ variable, mean)
#creating a tidy dataset file  
write.table(dataset.tidy, file = "tidydataset.txt" ,row.names = FALSE)