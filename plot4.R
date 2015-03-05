## subset data on just dates we want
EPC_Subset <- EPC_Read[(EPC_Read$Date == '1/2/2007'| EPC_Read$Date == '2/2/2007'),]

## load the library
library(plyr)

## mutate data and make new variable date and time by pasting date and time together
EPC_Subset1 <- mutate(EPC_Subset, datetime = paste(EPC_Subset$Date, EPC_Subset$Time) )

## mutate one more time and replace date and time with the strpdate function
EPC_Subset2 <- mutate(EPC_Subset1, datetime = strptime(datetime, format = "%d/%m/%Y %H:%M:%S"))

## start plot 4
png(filename = "plot4.png", width =480, height = 480) ## set up device

## set up a 2 column 2 row grid for graphs, moving side to side
par(mfrow = c(2,2)) 

## plot 1st graph
plot( EPC_Subset2$datetime,EPC_Subset2$Global_active_power, type = "l" , xlab = "",ylab = "Global Active Power")

##plot 2nd grapgh
plot( EPC_Subset2$datetime,EPC_Subset2$Voltage, type = "l" , xlab = "datetime",ylab = "Voltage")


## plot 3rd graph and annotate
plot( EPC_Subset2$datetime,EPC_Subset2$Sub_metering_1, type = "l" , xlab= "", ylab = "Energy sub metering")
lines(EPC_Subset2$datetime,EPC_Subset2$Sub_metering_2, col = "red")
lines(EPC_Subset2$datetime,EPC_Subset2$Sub_metering_3, col = "blue")
legend("topright", lty = 1 , lwd =2 ,  col= c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

## plot 4th graph
plot( EPC_Subset2$datetime,EPC_Subset2$Global_reactive_power, type = "l" , xlab = "datetime",ylab = "Global_reactive_power")
dev.off()

## end plot 4
