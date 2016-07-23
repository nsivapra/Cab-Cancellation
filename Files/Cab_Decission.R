# Load the party package. It will automatically load other dependent packages.
library(party)

#Read the final csv file.
mydata <- read.csv("cab_final.csv")

#Receive the information gain for each variable
library(FSelector)
print(information.gain(Car_Cancellation~package_id, mydata))
print(information.gain(Car_Cancellation~travel_type_id, mydata))
print(information.gain(Car_Cancellation~online_booking, mydata))
print(information.gain(Car_Cancellation~mobile_site_booking, mydata))
print(information.gain(Car_Cancellation~diffs, mydata))
print(information.gain(Car_Cancellation~from_month, mydata))
print(information.gain(Car_Cancellation~from_day, mydata))
print(information.gain(Car_Cancellation~to_month, mydata))
print(information.gain(Car_Cancellation~to_day, mydata))

#Variable Declaration
Car_Cancellation <- mydata$Car_Cancellation
diffs <- mydata$diffs
from_month <- mydata$from_month
to_month <- mydata$to_month

# Create the tree for from_month
output.tree <- ctree(Car_Cancellation ~ from_month, data = mydata)
png("airct.png", res=80, height=500, width=710) 
plot(output.tree, type = "simple") 
dev.off()

#Decision Tree for to_month
output.tree <- ctree(Car_Cancellation ~ to_month, data = mydata)
plot(output.tree, type = "simple")

#Decision Tree for diffs
output.tree <- ctree (Car_Cancellation ~ diffs, data = mydata)
plot(output.tree, type = "simple")