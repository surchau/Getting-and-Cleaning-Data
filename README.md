---
title: "README"
author: "Sureecha Chauhan"
date: "March 18, 2018"
output: html_document
---
## Submissions for the Week 4 Assignment of the Getting and Cleaning Course

#### The purpose of this assignment is to demonstrate  ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.  
The data is available at:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##### This repository contains  the following files:

#### 1.  R Script: run_analysis.R
 The prerequistite for running this script is that the working directory has already been set.  
  
  Executing the run_analysis.R script completes the following actions:  
    
* Downloads and unzip the source data files under data subfolder of working directory.  
  
* Reads into seperate tables the training set, the associated activity IDs and subject IDs.  
  
* Reads into seperate tables the test set, the associated activity IDs and subject IDs.  
  
* Creates vectors containing the features and activity label information which are used to add descriptors  
  
* Labels the variables in the columns of the test and training dataset with descriptive names using the created features vector. The variables are now easier to interpret than the original 'V_' descriptors.  
  
* Merges the training and the test sets to create one data set. 
  
* Merges the activity ID and subject ID tables for the training and test sets.  
  
* Add two 2 columns to the merged dataset so an activity ID and subject ID are assigned to each row. This links the recorded measurements to the invidividual subject and the activity they were undertaking.  
  
* Extract only the variables relating to the mean and standard deviation values for each measurement. The measurements have been selected where suffixed with mean() or std() which are the mean and standard deivation measurements for the signals. 
  
* Uses descriptive activity names to label the activities in the data set rather than the original activity number. This makes the data easier to interpret.  
  
* Creates 'wide' tidy data set called tidyData which contains a single row for each activity and subject combination and a single column for each variable mean value. The data set is ordered by subjectID in ascending order.  
  
* Creates a text file of tidyData so it can be exported and uploaded onto GitHub.  

#### 2. CodeBook.md 
A code book that describes the variables, the data, and transformations used to tidy the data.

#### 3. tidyData.txt
A text file containing the tidied data set. 