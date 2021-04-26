## Get and subset data set
sourcefile <- "household_power_consumption.txt"
all_power_data <- read.table(sourcefile, header = TRUE, 
                             sep = ";", stringsAsFactors = FALSE, 
                             dec = ".")

# Subsetting data for specific dates of 1/2/2007 and 2/2/2007
power_data <- all_power_data[all_power_data$Date %in% c("1/2/2007","2/2/2007") ,]

## Plot 2

## Extract the datetime as a POSIX date time object from the string
datetime <- strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S") 

## Plot to the file
png("plot2.png", width=480, height=480)
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()