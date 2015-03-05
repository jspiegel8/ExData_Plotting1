## step 1- set Working directory
## this is just mine I set to. setwd("C:/Users/z003db5u/Desktop/BI and Analytics Studying/Data Science - John Hopkins-Coursera/Exploratory Data Analysis - Course 4/Project 1")

## step 2 - read in file

EPC_Read <- read.table(".//exdata_data_household_power_consumption//household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

## subset data on just dates we want
EPC_Subset <- EPC_Read[(EPC_Read$Date == '1/2/2007'| EPC_Read$Date == '2/2/2007'),]

## load the library
library(plyr)

## mutate data and make new variable date and time by pasting date and time together
EPC_Subset1 <- mutate(EPC_Subset, datetime = paste(EPC_Subset$Date, EPC_Subset$Time) )

## mutate one more time and replace date and time with the strpdate function
EPC_Subset2 <- mutate(EPC_Subset1, datetime = strptime(datetime, format = "%d/%m/%Y %H:%M:%S"))

## start plot 1
## load png device, set name to plot1.png, make width and height 480
png(filename = "plot1.png", width =480, height = 480)
hist(EPC_Subset2$Global_active_power, col = "red" , main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
## plot 1 complete
