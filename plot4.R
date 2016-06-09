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

## Set up the plotting area to display 4 charts in a 2x2 grid, filling up rows first
par(mfrow = (c(2, 2)))    

## Create the first plot (same as that from plot2)
plot(datetime, subSetData$Global_active_power, type = "l", xlab = "", 
    ylab = "Global Active Power (kilowatts)")
    
## Create the second plot of datetime against Voltage, changing the ylab to the string 
## "Voltage"
plot(datetime, subSetData$Voltage, type = "l", ylab = "Voltage")

## Create the third plot, which is the same as our line plot in plot3
