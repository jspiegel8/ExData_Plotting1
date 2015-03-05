## subset data on just dates we want
EPC_Subset <- EPC_Read[(EPC_Read$Date == '1/2/2007'| EPC_Read$Date == '2/2/2007'),]

## load the library
library(plyr)

## mutate data and make new variable date and time by pasting date and time together
EPC_Subset1 <- mutate(EPC_Subset, datetime = paste(EPC_Subset$Date, EPC_Subset$Time) )

## mutate one more time and replace date and time with the strpdate function
EPC_Subset2 <- mutate(EPC_Subset1, datetime = strptime(datetime, format = "%d/%m/%Y %H:%M:%S"))


## start plot 3
png(filename = "plot3.png", width =480, height = 480)
## first plot the base plot and the first line for submetering 1, color black
plot( EPC_Subset2$datetime,EPC_Subset2$Sub_metering_1, type = "l" , xlab= "", ylab = "Energy sub metering")
## add the second submetering line, submetering 2 with color red
lines(EPC_Subset2$datetime,EPC_Subset2$Sub_metering_2, col = "red")
## add sub metering 3 and color blue
lines(EPC_Subset2$datetime,EPC_Subset2$Sub_metering_3, col = "blue")
## add legend
legend("topright", lty = 1 , lwd =2 ,  col= c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
## end plot 3