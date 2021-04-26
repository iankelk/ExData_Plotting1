## Get and subset data set
sourcefile <- "household_power_consumption.txt"
all_power_data <- read.table(sourcefile, header = TRUE, 
                             sep = ";", stringsAsFactors = FALSE, 
                             dec = ".")

# Subsetting data for specific dates of 1/2/2007 and 2/2/2007
power_data <- all_power_data[all_power_data$Date %in% c("1/2/2007","2/2/2007") ,]

## Plot 3

## Extract the datetime as a POSIX date time object from the string
datetime <- strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S") 

sub_metering_1 <- as.numeric(power_data$Sub_metering_1)
sub_metering_2 <- as.numeric(power_data$Sub_metering_2)
sub_metering_3 <- as.numeric(power_data$Sub_metering_3)

## Plot to the file
png("plot3.png", width=480, height=480)
plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"),
       lwd=2)
dev.off()