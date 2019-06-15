

library(dplyr)

dir<-"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset"

Xtest <- read.table(paste0(getwd(),dir,"/test/x_test.txt"))
Ytest <- read.table(paste0(getwd(),dir,"/test/y_test.txt"))
Stest <-read.table(paste0(getwd(),dir,"/test/subject_test.txt"))

Xtrain <- read.table(paste0(getwd(),dir,"/train/x_train.txt"))
Ytrain <- read.table(paste0(getwd(),dir,"/train/y_train.txt"))
Strain <- read.table(paste0(getwd(),dir,"/train/Subject_train.txt"))

features <- read.table(paste0(getwd(),dir,"/features.txt"))
labels <- read.table(paste0(getwd(),dir,"/activity_labels.txt"))

#Appropriately labels the data set with descriptive variable names.

names(Xtest)<-features[,2]
names(Xtrain)<-features[,2]
names(Ytest)<-"idactivity"
names(Ytrain)<-"idactivity"
names(Stest)<- "subject"
names(Strain)<- "subject"

variables <- features[,2]

#Merges the training and the test sets to create one data set.
Ttest <- cbind(Xtest,Ytest,Stest)
Ttrain<- cbind(Xtrain,Ytrain,Strain)
Total<- rbind(Ttest, Ttrain)
                 
#Extracts only the measurements on the mean and standard deviation for each measurement.

lista1 <- grep("mean", features[[2]])
lista2 <- grep("std", features[[2]])
lista <- c(lista1, lista2)
ele <-c(lista, length(Total[1,]),length(Total[1,])-1)
Selected <- Total[,ele]

#Uses descriptive activity names to name the activities in the data set

names(labels) <- c("idactivity", "activity")
Selected <- merge(Selected, labels, by = "idactivity")

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

Tidy <- Selected %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))

write.table(Tidy,"Tidy.txt", row.name = FALSE)
