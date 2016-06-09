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

## Open a PNG graphical device with required filename
## NB. No need to specify width and height as the defaults are 480 x 480
png("/Users/hamedbh/GitHubRepos/ExData_Plotting1/plot1.png")

## Create the histogram as seen in the example using arguments to set colour to red, 
## x-axis label to "Global Active Power (kilowatts)" and the main title to "Global 
## Active Power"
with(subSetData, hist(Global_active_power, col = "red", 
    xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

## Close graphical device to save the PNG
dev.off()