"Getting and Cleaning Data" Course Project Code Book
The script is invented to analyze the data from UCI HAR Dataset. It's supposed that archive is extracted to the working directory.

The following files from the initial dataset is used:

1-features.txt - includes the descriptions for features measured
2-train/X_train.txt - includes the measurements of the features in train set (one row - 1 measurement of 561 features)
3-test/X_test.txt - includes the measurements of the features in test set
4-train/subject_train.txt - subject for each measurement from the train set
5-test/subject_test.txt - subject for each measurement from the test set
6-train/y_train.txt - activity (from 1 to 6) for each measurement from the train set
7-test/y_test.txt - activity (from 1 to 6) for each measurement from the test set

Script involves the following stages:
first we read feature and activity data
then read train and test then merge train and test data
we search for mean ,std ,activity,subject colmn

