# Cab_Confusion
#Read the csv for the real and predicted values.
mydata = read.csv("cab.csv", skip = 0, nrows = 10000) #PREDICT
df <- read.csv("cab_real.csv") #REAL

#Create a confusion matrix for travel type
test <- table(df$travel_type_id, mydata$travel_type_id)
library(caret) 
confusionMatrix(test)

#Create a confusion matrix for online booking
test <- table(df$online_booking, mydata$online_booking)
library(caret) 
confusionMatrix(test)

#Create a confusion matrix for mobile site booking.
test <- table(df$mobile_site_booking, mydata$mobile_site_booking)
library(caret) 
confusionMatrix(test)
#----------

#ROC and AUC for online booking
library(pROC)
ROC1 <- roc(df$online_booking, mydata$online_booking)
plot(ROC1, col = "blue")

#ROC and AUC for from_date
library(pROC)
ROC1 <- roc(as.numeric(df$from_date), as.numeric(mydata$from_date))
plot(ROC1, col = "blue")

#ROC and AUC for from_lat
library(pROC)
ROC1 <- roc(as.ordered(df$from_lat), as.ordered(mydata$from_lat))
plot(ROC1, col = "blue")

