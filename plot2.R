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

#create plot - png format, 480x480px
png(filename="plot2.png", width=480,height=480,units="px")
plot(inputData$DateTime, inputData$Global_active_power,
     type="l", ylab="Global Active Power (kilowatts)",
      xlab="")
dev.off()
