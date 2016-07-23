#Read the csv file and set the NULL value of package_id to 0
mydata = read.csv("cab.csv", na.strings='NULL')
mydata$package_id[is.na(mydata$package_id)] <- 0

#Format for the to_date with an origin
mydata$to_date <- as.Date(mydata$to_date, origin = "1900-01-01")
mydata$to_date


#Create the variable diffs and round the day
mydata$booking_created <- as.POSIXct(mydata$booking_created,
                                      format='%m/%d/%Y %H:%M')
mydata$from_date <- as.POSIXct(mydata$from_date,
                                      format='%m/%d/%Y %H:%M')
mydata$diffs<- difftime(mydata$from_date ,mydata$booking_created , units = c("days"))
mydata$diffs<-as.numeric(mydata$diffs) 
mydata$diffs<-round(mydata$diffs)
mydata$diffs

#Parse the from date to month
mydata$from_date <- as.POSIXct(mydata$from_date, format='%d/%m/%Y %H:%M')
mydata$from_month <- format(mydata$from_date, format='%m')
mydata$from_month<-as.numeric(mydata$from_month) 
mydata$from_month

#Parse the from date to day.
mydata$from_day <- format(mydata$from_date, format='%d')
mydata$from_day <-as.numeric(mydata$from_day) 
mydata$from_day

#Parse the from_date to time.
mydata$from_time <- format(mydata$from_date, format='%H:%M')
mydata$from_time

#Parse the to_date to month, and set NULL value to 0
mydata$to_date <- as.POSIXct(mydata$to_date, format='%d/%m/%Y %H:%M')
mydata$to_month <- format(mydata$to_date, format='%m')
mydata$to_month<-as.numeric(mydata$to_month) 
mydata$to_month
mydata$to_month[is.na(mydata$to_month)] <- 0

#Parse the to_date to day.
mydata$to_day <- format(mydata$to_date, format='%d')
mydata$to_day <-as.numeric(mydata$to_day) 
mydata$to_day

#Parse the to_time to time
mydata$to_time <- format(mydata$to_date, format='%H:%M')
mydata$to_time

#Set any NULL value to 0 to not disrupt the modeling.
mydata$from_month[is.na(mydata$from_month)] <- 0
mydata$diffs[is.na(mydata$diffs)] <- 0
summary(mydata)

#Write to a csv file.
write.csv(mydata, file = "cab_final.csv")