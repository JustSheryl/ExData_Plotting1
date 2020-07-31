###Exploratory Data Analysis Week 1 project script

### INITIAL SET UP WORKSPACE

# set working directory
directory<-Sys.getenv("directory")
setwd(directory)

# read in data, pull out only rows that we need
inputFile="household_power_consumption.txt"
inputData <-read.table(file=inputFile, sep=";", header=TRUE, na.strings="?")
inputData<-subset(inputData, Date %in% c("1/2/2007", "2/2/2007"))

#Concatenate Date and Time
library(lubridate)
inputData$DateTime<-dmy_hms(paste(inputData$Date, inputData$Time))

#create file for plots - png format, 480x480
png(filename="plot4.png", width=480,height=480,units="px")

# 4 plots, 2 columns, 2 rows each column
par(mfcol=c(2,2))

# 1st plot, col1,row1
plot(inputData$DateTime,inputData$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

# 2nd plot, col1, row2
plot(inputData$DateTime, inputData$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(inputData$DateTime, inputData$Sub_metering_2, type="l", col="red")
lines(inputData$DateTime, inputData$Sub_metering_3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red","blue"), lty=c(1,1,1))

# 3rd plot, col2, row1
plot(inputData$DateTime,inputData$Voltage, type="l",
     xlab="datetime",ylab="Voltage")

# 4th plot, col2, row2
plot(inputData$DateTime, inputData$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()