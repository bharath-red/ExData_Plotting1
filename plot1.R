#plot1: function to read the read the data and plot 1st plot
plot1 <- function ()
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
    elecData$Global_active_power <- as.numeric(elecData$Global_active_power)
    
    #Plot the data
    hist(elecData$Global_active_power, col = "red", 
         xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
}