# Getting and Cleaning Data course Project assignment Script
# # The purose of this project is to collect, work with and clean a data set
# The goal is to prepare tidy data for later analysis

## assumption working directory has been defined

## download data to data directory

if(!file.exists('./data'))
{
  dir.create('./data')
}

## Data URL
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(dataUrl,destfile='./data/UciHarDataSet.zip')

##unzip files to data directory so all our files are under data folder
unzip(zipfile ='./data/UciHarDataSet.zip', overwrite = TRUE, exdir = './data')

## check the files have been unzipped

dir('./data')


## define path for file.path function to store all file names under datafiles
datapath <- file.path("./data","UCI HAR Dataset")

## store all files under vector

datafiles <- list.files(datapath,recursive = TRUE)

## Read test data 
xTest <- read.table(file.path(datapath,"test","X_test.txt"),header = FALSE)
yTest <- read.table(file.path(datapath,"test","y_test.txt"))
subjectTest <- read.table(file.path(datapath,"test","subject_test.txt")) 

str(xTest)  ## 2947 rows with 561 columns
head(xTest,4)
str(yTest)  ## 2947 rows with 1 column
str(subjectTest)   ## 2947 rows with 1 column

## Read train data
xTrain <- read.table(file.path(datapath,"train","X_train.txt"))
yTrain <- read.table(file.path(datapath,"train","y_train.txt"))
subjectTrain <- read.table(file.path(datapath,"train","subject_train.txt"))

#str(xTrain)  ## 7352 rows with 561 columns
#str(yTrain)  ## 7352 rows with 1 column
#str(subjectTrain)   ## 7352 rows with 1 column

## training data set has 7352 observations

## Read features data
features <- read.table(file.path(datapath,"features.txt"))
#str(features)  ## 561 rows with 2 columns


## Read activity_labels data
activityLabels <- read.table(file.path(datapath,"activity_labels.txt"))
#str(activityLabels) ## 6 rows with 2 columns

##  I am assigning column names before merging data. 
## Assign column names to train and test data sets
## the second column of features data frame stores the column names

## Assign column names to Test data
colnames(xTest) <- features[,2]
str(xTest)

colnames(yTest) <- "activityId"

colnames(subjectTest) <- "subjectId"

## ## Assign column names to Train data
colnames(xTrain) <- features[,2]
str(xTrain)

colnames(yTrain) <- "activityId"

colnames(subjectTrain) <- "subjectId"

## assign column names for activity lables
colnames(activityLabels) <- c('activityId','activityType')


### Performing task 1 of assignment - start ###
#### Merges the training and the test sets to create one data set.

# step1 - Merge  yTest(activityId), subjectTest(subjectId)and xTest using column binding
test <- cbind(yTest,subjectTest,xTest)

# step 2 - Merger yTrain,subjectTrain, and xTrain using column binding
train <- cbind(yTrain, subjectTrain, xTrain)

# step 3 - Merge train and test data using row binding

combined <- rbind(train,test)

### Performing task 1 of assignment - end ###

### Performing task 2 of assignment - start ###
#### Extracts only the measurements on the mean and standard deviation for each measurement

# step1 - we need to get columns with mean() and std() for each measurement
### read all available column names
columnNames <- colnames(combined)

# step 2 - use grepl to return logical vector

meanAndstd <- (grepl("activityId", columnNames) 
               | grepl("subjectId",columnNames)
               | grepl("mean..", columnNames)
               | grepl("std..", columnNames) )
# step 3 - get the required dataset - we got 81 columns out of 563
datasetMeanAndstd <- combined[,meanAndstd == TRUE]

### Performing task 2 of assignment - end ###

### Performing task 3 of assignment - start ###
#### Use descriptive activity names to name the activities in the data set

# step1 - 2nd column of activityLabels has the names of activities
## Merge datasetMeanAndstd and activityLabels data frames by activityId
## all.x= TRUE add all rows from datasetMeanAndstd

datasetWithActiviyNames <- merge(datasetMeanAndstd,activityLabels,
                                 by = 'activityId',all.x=TRUE)
datasetWithActiviyNames <- datasetWithActiviyNames[,c(2,ncol(datasetWithActiviyNames),3:(ncol(datasetWithActiviyNames)-1))]


## step2 - Already added column names 
names(datasetMeanAndstd)
names(datasetWithActiviyNames )

### Performing task 3 of assignment - end ###

### Performing task 4 of assignment - start ###
#### Appropriately labels the data set with descriptive variable names

# step 1  - the output of names(datasetwithActivityNames) we can replace
 ##  Acc with Accelerometer
names(datasetWithActiviyNames) <- gsub('Acc','Accelerometer',
                                       names(datasetWithActiviyNames))
## Gyro with Gyroscope
names(datasetWithActiviyNames) <- gsub('Gyro','Gyroscope',
                                       names(datasetWithActiviyNames))
## BodyBody with Body
names(datasetWithActiviyNames) <- gsub('BodyBody','Body',
                                       names(datasetWithActiviyNames))
## Mag with Magnitude
names(datasetWithActiviyNames) <- gsub('Mag','Magnitude',
                                       names(datasetWithActiviyNames))

## f with Frequency
names(datasetWithActiviyNames) <- gsub('^f','frequency',
                                       names(datasetWithActiviyNames))
## t with Time
names(datasetWithActiviyNames) <- gsub('^t','time',
                                       names(datasetWithActiviyNames))

names(datasetWithActiviyNames) <- gsub('-mean()','Mean',
                                       names(datasetWithActiviyNames))

names(datasetWithActiviyNames) <- gsub('-meanFreq()','MeanFrequency',
                                       names(datasetWithActiviyNames))
names(datasetWithActiviyNames) <- gsub('-std()','STD',
                                       names(datasetWithActiviyNames))

names(datasetWithActiviyNames)
str(datasetWithActiviyNames)


### Performing task 4 of assignment - end ###

### Performing task 5 of assignment - start ###
#### From the data set in step 4, creates a second, 
####independent tidy data set with the average of each variable for each
#### activity and each subject.
tidyData <- aggregate(.~subjectId+activityType, datasetWithActiviyNames, mean)
tidyData <- arrange(tidyData, subjectId)


# copy tidyData to text file for uploading into GitHub
write.table(tidyData,"tidyData.txt",row.names = FALSE)

### Performing task 5 of assignment - end ###


