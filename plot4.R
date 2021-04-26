## Get and subset data set
sourcefile <- "household_power_consumption.txt"
all_power_data <- read.table(sourcefile, header = TRUE, 
                             sep = ";", stringsAsFactors = FALSE, 
                             dec = ".")

# Subsetting data for specific dates of 1/2/2007 and 2/2/2007
power_data <- all_power_data[all_power_data$Date %in% c("1/2/2007","2/2/2007") ,]

## Plot 4

global_active_power <- as.numeric(power_data$Global_active_power)
global_reactive_power <- as.numeric(power_data$Global_reactive_power)
voltage <- as.numeric(power_data$Voltage)
sub_metering_1 <- as.numeric(power_data$Sub_metering_1)
sub_metering_2 <- as.numeric(power_data$Sub_metering_2)
sub_metering_3 <- as.numeric(power_data$Sub_metering_3)

## Plot to the file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## Plot A
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power")

## Plot B
plot(datetime, voltage, type="l", ylab="Voltage")

## Plot C
plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"),
       lwd=2)

##Plot D
plot(datetime, global_reactive_power, type="l", ylab="Global_reactive_power")
dev.off()
