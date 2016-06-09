dataFile <- "./data/household_power_consumption.txt"

## Read in a small sample of the data quickly and get classes
sampleData <- read.table(dataFile, header = TRUE, sep = ";", na.strings = "?",
    stringsAsFactors = FALSE, nrows = 5)
classes <- sapply(sampledata, class)

## Read large data file into memory using colClasses to speed up the process
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
    na.strings = "?", stringsAsFactors=FALSE, nrows = 2075259, colClasses = classes)

## Assign a subset of the data to variable subSetData
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Create a variable datetime which is a vector containing date-formatted dates & times
## from the first two columns of the data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), 
    "%d/%m/%Y %H:%M:%S")

## Open a PNG graphical device with required filename
## NB. No need to specify width and height as the defaults are 480 x 480
png("/Users/hamedbh/GitHubRepos/ExData_Plotting1/plot4.png")

## Set up the plotting area to display 4 charts in a 2x2 grid, filling up rows first
par(mfrow = (c(2, 2)))    

## Create the first plot (same as that from plot2)
plot(datetime, subSetData$Global_active_power, type = "l", xlab = "", 
    ylab = "Global Active Power (kilowatts)")
    
## Create the second plot of datetime against Voltage, changing the ylab to the string 
## "Voltage"
plot(datetime, subSetData$Voltage, type = "l", ylab = "Voltage")

## Create the third plot, which is the same as our line plot in plot3
plot(datetime, subSetData$Sub_metering_1, type = "l", xlab = "", 
    ylab = "Energy sub metering")
points(datetime, subSetData$Sub_metering_2, type = "l", col = "red")
points(datetime, subSetData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", 
    "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
    
## Create the fourth line plot of datetime against Global_reactive_power, 
## remembering to change the ylab to Global_reactive_power
plot(datetime, subSetData$Global_reactive_power, type = "l", ylab = 
    "Global_reactive_power")

## Close the graphical device to save the PNG
dev.off()