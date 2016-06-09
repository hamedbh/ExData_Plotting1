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
png("/Users/hamedbh/GitHubRepos/ExData_Plotting1/plot3.png")

## Create the line plot with datetime and the first sub-metering variable
plot(datetime, subSetData$Sub_metering_1, type = "l", xlab = "", 
    ylab = "Energy sub metering")

## Add a line for the second set of sub-metering data in red
points(datetime, subSetData$Sub_metering_2, type = "l", col = "red")

## Now add the line in blue for the third sub-metering set
points(datetime, subSetData$Sub_metering_3, type = "l", col = "blue")
## Insert a legend with the correct labels and colours
legend("topright", c("Sub_metering_1", "Sub_metering_2", 
    "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Close graphical device to save the PNG
dev.off()