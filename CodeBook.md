---
title: "CodeBook"
author: "Sureecha Chauhan"
date: "March 18, 2018"
output: html_document
---
## Code Book for Coursera Week 4 Assignment of the Getting and Cleaning Course

This is the code book for the tidyData set created when the run_analysis_R script is run

## Data source

The source data for the project is the 'Human Activity Recognition Using Smartphones Data Set which was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  Each person (subject) performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)) wearing a smartphone (Samsung Galaxy S II) on the waist.  Using its embedded accelerometer and gyroscope,  3-axial linear acceleration and 3-axial angular velocity measurements at a constant rate of 50Hz were captured. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The raw source data files can be found here:  [Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

*Citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.*

## Transformations carried out

1 - Raw data sets related to training were downloaded into tables ( source files - X_train.txt, y_train.txt,subject_train.txt)  
2 - Raw data sets related to test observations were downloaded into table ( source files - X_test.txt, y_test.txt, subject_test.txt)  
3 - Dataset containing column names were downloaded into table ( source file - features.txt)  
4 - Activity labels were downloaded into table (source file activity_labels.txt)  
5 - Assigned column names to xTest, yTest, subjectTest and xTrain, yTrain, subjectTrain data sets    
6 - Merged yTest,subjectTest and xTest tables using column binding to test data set    
7 - Merged yTrain, subjectTrain, and xTrain tables using column binding to train data set    
8 - Merged both train and test using row binding to make one combined data set  
9 - Only measurements relating to mean and standard deviation calculations were extracted from the combined data set. These were identified where the measurement name had either mean() or std() contained in the description. The remaining columns were excluded.  
10 - The activty IDs were replaced with the appropriate descriptors e.g. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  
11 -A 'wide' tidy data set was created where there is a single row for each activty and subject combination and a single column for  each selected measurement average (mean) value.  The data set is ordered by subject in ascending order.  

## Data Set Variables

### Generated fields
subjectID (integer) - ID of subject performing the activity. Ranges from 1-30 (integer)

activityType (factor)- Activity the subject is performing.  6 possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. 

### Measurement variables
Each variable is the mean value of all measurements recorded for that variable for each subject and activity. The values are bounded between -1 and 1. 
timeBodyAccelerometerMean()-X                    (num) 
  timeBodyAccelerometerMean()-Y                    (num)  
  timeBodyAccelerometerMean()-Z                    (num)  
  timeBodyAccelerometerSTD()-X                     (num)  
  timeBodyAccelerometerSTD()-Y                     (num)  
  timeBodyAccelerometerSTD()-Z                     (num)  
  timeGravityAccelerometerMean()-X                 (num)  
  timeGravityAccelerometerMean()-Y                 (num)  
  timeGravityAccelerometerMean()-Z                 (num)  
  timeGravityAccelerometerSTD()-X                  (num)  
  timeGravityAccelerometerSTD()-Y                  (num)  
  timeGravityAccelerometerSTD()-Z                  (num)  
  timeBodyAccelerometerJerkMean()-X                (num)  
  timeBodyAccelerometerJerkMean()-Y                (num)  
  timeBodyAccelerometerJerkMean()-Z                (num)  
  timeBodyAccelerometerJerkSTD()-X                 (num)  
  timeBodyAccelerometerJerkSTD()-Y                 (num)  
  timeBodyAccelerometerJerkSTD()-Z                 (num)  
  timeBodyGyroscopeMean()-X                        (num)  
  timeBodyGyroscopeMean()-Y                        (num)  
  timeBodyGyroscopeMean()-Z                        (num)  
  timeBodyGyroscopeSTD()-X                         (num)  
  timeBodyGyroscopeSTD()-Y                         (num)  
  timeBodyGyroscopeSTD()-Z                         (num)  
  timeBodyGyroscopeJerkMean()-X                    (num)  
  timeBodyGyroscopeJerkMean()-Y                    (num)  
  timeBodyGyroscopeJerkMean()-Z                    (num)  
  timeBodyGyroscopeJerkSTD()-X                     (num)  
  timeBodyGyroscopeJerkSTD()-Y                     (num)  
  timeBodyGyroscopeJerkSTD()-Z                     (num)  
  timeBodyAccelerometerMagnitudeMean()             (num)  
  timeBodyAccelerometerMagnitudeSTD()              (num)  
  timeGravityAccelerometerMagnitudeMean()          (num)  
  timeGravityAccelerometerMagnitudeSTD()           (num)  
  timeBodyAccelerometerJerkMagnitudeMean()         (num)  
  timeBodyAccelerometerJerkMagnitudeSTD()          (num)  
  timeBodyGyroscopeMagnitudeMean()                 (num)  
  timeBodyGyroscopeMagnitudeSTD()                  (num)  
  timeBodyGyroscopeJerkMagnitudeMean()             (num)  
  timeBodyGyroscopeJerkMagnitudeSTD()              (num)  
  frequencyBodyAccelerometerMean()-X               (num)  
  frequencyBodyAccelerometerMean()-Y               (num)  
  frequencyBodyAccelerometerMean()-Z               (num)  
  frequencyBodyAccelerometerSTD()-X                (num)  
  frequencyBodyAccelerometerSTD()-Y                (num)  
  frequencyBodyAccelerometerSTD()-Z                (num)  
  frequencyBodyAccelerometerMeanFreq()-X           (num)  
  frequencyBodyAccelerometerMeanFreq()-Y           (num)  
  frequencyBodyAccelerometerMeanFreq()-Z           (num)  
  frequencyBodyAccelerometerJerkMean()-X           (num)  
  frequencyBodyAccelerometerJerkMean()-Y           (num)  
  frequencyBodyAccelerometerJerkMean()-Z           (num)  
  frequencyBodyAccelerometerJerkSTD()-X            (num)  
  frequencyBodyAccelerometerJerkSTD()-Y            (num)  
  frequencyBodyAccelerometerJerkSTD()-Z            (num)  
  frequencyBodyAccelerometerJerkMeanFreq()-X       (num)  
  frequencyBodyAccelerometerJerkMeanFreq()-Y       (num)  
  frequencyBodyAccelerometerJerkMeanFreq()-Z       (num)  
  frequencyBodyGyroscopeMean()-X                   (num)  
  frequencyBodyGyroscopeMean()-Y                   (num)  
  frequencyBodyGyroscopeMean()-Z                   (num)  
  frequencyBodyGyroscopeSTD()-X                    (num)  
  frequencyBodyGyroscopeSTD()-Y                    (num)  
  frequencyBodyGyroscopeSTD()-Z                    (num)  
  frequencyBodyGyroscopeMeanFreq()-X               (num)  
  frequencyBodyGyroscopeMeanFreq()-Y               (num)  
  frequencyBodyGyroscopeMeanFreq()-Z               (num)  
  frequencyBodyAccelerometerMagnitudeMean()        (num)  
  frequencyBodyAccelerometerMagnitudeSTD()         (num)  
  frequencyBodyAccelerometerMagnitudeMeanFreq()    (num)  
  frequencyBodyAccelerometerJerkMagnitudeMean()    (num)  
  frequencyBodyAccelerometerJerkMagnitudeSTD()     (num)  
  frequencyBodyAccelerometerJerkMagnitudeMeanFreq()(num)  
  frequencyBodyGyroscopeMagnitudeMean()            (num)  
  frequencyBodyGyroscopeMagnitudeSTD()             (num)  
  frequencyBodyGyroscopeMagnitudeMeanFreq()        (num)  
  frequencyBodyGyroscopeJerkMagnitudeMean()        (num)  
  frequencyBodyGyroscopeJerkMagnitudeSTD()         (num)  
  frequencyBodyGyroscopeJerkMagnitudeMeanFreq()    (num)  