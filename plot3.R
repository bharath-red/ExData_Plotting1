#plot3: function to read the read the data and plot 1st plot
plot3 <- function ()
{
    #read entire data from the csv file
    elecData <- read.csv("household_power_consumption.txt",  
                         colClasses= "character", sep=";")
    
    #subset the data for only the relevant dates
    elecData <- subset(elecData, Date == "1/2/2007"| Date == "2/2/2007")
    
    #Convert the time and date from character strings to posix formats
    elecData$Time <- strptime(paste(elecData$Date, elecData$Time), format = 
                                  "%d/%m/%Y %H:%M:%S")
    elecData$Date <- as.Date(elecData$Date, "%d/%m/%Y")
    
    #Convert relevant data to numeric format
    elecData$Sub_metering_1 <- as.numeric(elecData$Sub_metering_1)
    elecData$Sub_metering_2 <- as.numeric(elecData$Sub_metering_2)
    elecData$Sub_metering_3 <- as.numeric(elecData$Sub_metering_3) 

    with(elecData, plot(Time, Sub_metering_1, type="n", ylab = "Energy sub metering"))
    with(elecData, lines(Time, Sub_metering_1, col = "black"))
    with(elecData, lines(Time, Sub_metering_2, col = "red"))
    with(elecData, lines(Time, Sub_metering_3, col = "blue"))
    legend( "topright" , pch = "-" , col = c("black", "red" , "blue" ), 
            legend = c( "Sub_metering_1" , "Sub_metering_2", "Sub_metering_3" ))
}