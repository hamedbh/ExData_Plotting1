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
png("/Users/hamedbh/GitHubRepos/ExData_Plotting1/plot2.png")

## Create the line plot using the plot command, type set to "l" for a line plot (instead 
## of a scatter), xlab set to an empty string, ylab as "Global Active Power (kilowatts)"
plot(datetime, subSetData$Global_active_power, type = "l", xlab = "", 
    ylab = "Global Active Power (kilowatts)")

## Close graphical device to save the PNG
dev.off()