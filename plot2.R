## subset data on just dates we want
EPC_Subset <- EPC_Read[(EPC_Read$Date == '1/2/2007'| EPC_Read$Date == '2/2/2007'),]

## load the library
library(plyr)

## mutate data and make new variable date and time by pasting date and time together
EPC_Subset1 <- mutate(EPC_Subset, datetime = paste(EPC_Subset$Date, EPC_Subset$Time) )

## mutate one more time and replace date and time with the strpdate function
EPC_Subset2 <- mutate(EPC_Subset1, datetime = strptime(datetime, format = "%d/%m/%Y %H:%M:%S"))

##start plot 2
png(filename = "plot2.png", width =480, height = 480)
##use datetime for x axis, and global active for y. type = l means line, set xlabel to nothing
plot( EPC_Subset2$datetime,EPC_Subset2$Global_active_power, type = "l" , xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
## End Plot 2