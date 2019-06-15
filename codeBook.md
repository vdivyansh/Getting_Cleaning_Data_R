1. Reads the data set and imports all the files
2. Appropriately labels the data set with descriptive variable names that we get from features.txt.
3. Merges all the tran and test files into Total
4. Extracts the measurements from Total that contain "mean" or "std" and save those in Selected
5. Lables the activities merging Selected with lables(activity_lables.txt) using idactivity
6. Using Selectedcreates a second, independent tidy data set with the average of each variable for each activity and each subject using the group_by() and summarise_all functions
7. Creates a file called Tidy.txt
