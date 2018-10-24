library(stringr)

X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")

X<-rbind(X_train,X_test)
y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)

rm(X_train)
rm(X_test)
rm(y_train)
rm(y_test)
rm(subject_train)
rm(subject_test)

mean_or_std<- (str_detect(as.character( features$V2),"mean") | str_detect(as.character( features$V2),"std") ) & !str_detect(as.character( features$V2),"meanFreq")

X<-X[,mean_or_std]

names(X)<-as.character(features[mean_or_std,"V2"])


y$V1<-activity_labels[y$V1,"V2"]

names(y)<-c("activity")
names(subject)<-c("subject")

X_y_subject<-cbind(X,y,subject)

rm(X)
rm(y)
rm(subject)

library(dplyr)

X_y_subject_tbldf<-tbl_df(X_y_subject)

by_act_by_subj<-group_by(X_y_subject_tbldf,activity,subject)

res4<-summarise_all(by_act_by_subj,mean)

res4<-as.data.frame(res4)

l<-length(colnames(res4))

colnames(res4)[3:l]<-sapply(colnames(res4)[3:l], function(x){paste0("Mean-of-",x)} )

write.table(res4,file="projectdata.txt",row.name=FALSE)

rm(res4)
rm(X_y_subject)
rm(X_y_subject_tbldf)
rm(by_act_by_subj)
rm(activity_labels)
rm(features)
