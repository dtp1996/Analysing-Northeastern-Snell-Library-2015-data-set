setwd("C:/Users/DTP/Desktop/MS Analytics/Hackathon")
library(lubridate)


jan<-read.csv("Jan.csv")
feb<-read.csv("Feb.csv")
mar<-read.csv("Mar.csv")
apr<-read.csv("Apr.csv")
may<-read.csv("May.csv")
june<-read.csv("June.csv")
july<-read.csv("July.csv")
aug<-read.csv("Aug.csv")
sep<-read.csv("Sep.csv")
oct<-read.csv("Oct.csv")
nov<-read.csv("Nov.csv")
dec<-read.csv("Dec.csv")



Yearly<-rbind(jan,feb,mar,apr,may,june,july,aug,sep,oct,nov,dec)

Yearly[Yearly==""]<-NA

Yearly<-Yearly[complete.cases(Yearly),]

write.csv(Yearly, file = "Year-2015_clean.csv")

Yearly$TRAN_DATE<-substr(Yearly$TRAN_DATE,0,9)

Yearly$TRAN_DATE<-as.Date(Yearly$TRAN_DATE,format = "%m/%d/%Y")

w = table(Yearly$COLL)
w<-data.frame(w)

plot(w,type = 'h',ylim=range(0,400000),xlab="Colleges",ylab="Count of Entries (e = 1 lack)",yaxt='n',main="Visiting frquency of students in a year by college")
axis(2, at = seq(0,400000,by=50000))

Yearly$month<-format(Yearly$TRAN_DATE,"%m")

# v$mon<-c("")
# library(dplyr)
# 
# 
# # create a vector with letters in the desired order
# v$Var1 <- row.names("Apr", "Aug", "Dec","Feb","Jan","Jul","Jun","Mar","May","Nov","Oct","Sep")
# 
# v<-v[c("January", "February", "March","April","May","June","July","August","September","October","November","December"),]

v = table(Yearly$month)
v<-data.frame(v)

v[order(match(v$Var1, month.abb)), ]

plot(v,type = 'h',ylim=range(0,300000),xlab="Month",ylab="Count of Entries (e = 1 lack)",main="Visiting frquency of students in a year by Month")


