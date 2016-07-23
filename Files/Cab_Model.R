#Load the packages for logisitic regression modeling.
library(ggplot2)
library(woe)
library(riv)

#Read the wrangled csv file.
mydata <- read.csv("cab_final.csv")

#Find the IV and WOE for each variable
iv.mult(mydata, "Car_Cancellation", vars = c("package_id"))
iv.mult(mydata, "Car_Cancellation", vars = c("travel_type_id"))
iv.mult(mydata, "Car_Cancellation", vars = c("online_booking"))
iv.mult(mydata, "Car_Cancellation", vars = c("mobile_site_booking"))
iv.mult(mydata, "Car_Cancellation", vars = c("diffs"))
iv.mult(mydata, "Car_Cancellation", vars = c("from_month"))
iv.mult(mydata, "Car_Cancellation", vars = c("from_day"))
iv.mult(mydata, "Car_Cancellation", vars = c("to_month"))
iv.mult(mydata, "Car_Cancellation", vars = c("to_day"))

#-----------------------------------------------------------

#Variable Declaration
diffs <- mydata$diffs
Car_Cancellation <- mydata$Car_Cancellation
online_booking <- mydata$online_booking
from_month <- mydata$from_month
to_month <- mydata$to_month

#Logisitic curve for from_month
library(ggplot2)
ggplot(mydata, aes(x=from_month, y=Car_Cancellation)) + ylim(0, 1) +
  stat_smooth(method.args=list(family="binomial"), se=FALSE)

#Logisitic curve for to_month
library(ggplot2)
ggplot(mydata, aes(x=to_month, y=Car_Cancellation)) + ylim(0,1) +
  stat_smooth(method.args=list(family="binomial"), se=FALSE)

#Difference between from_date and booking_created
library(ggplot2)
ggplot(mydata, aes(x=diffs, y=Car_Cancellation))  + ylim(0, 1) +
  stat_smooth(method.args=list(family="binomial"), se=FALSE)

#Logisitic curve for online booking
online <- jitter(as.numeric(online_booking))
library(ggplot2)
ggplot(mydata, aes(x=online, y=Car_Cancellation)) + ylim(0,1) +
  stat_smooth(method.args=list(family="binomial"), se=FALSE) 