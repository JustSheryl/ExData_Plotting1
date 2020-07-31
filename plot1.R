###Exploratory Data Analysis Week 1 project script
  
### INITIAL SET UP WORKSPACE

# set working directory
directory<-Sys.getenv("directory")
setwd(directory)

# read in data, pull out only rows that we need
inputFile="household_power_consumption.txt"
inputData <-read.table(file=inputFile, sep=";", header=TRUE, na.strings="?")
inputData<-subset(inputData, Date %in% c("1/2/2007", "2/2/2007"))

#create plot - png format, 480x480px
png(filename="plot1.png", width=480,height=480,units="px")
hist(inputData$Global_active_power, col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
dev.off()


