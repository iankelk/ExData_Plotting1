## Get and subset data set
sourcefile <- "household_power_consumption.txt"
all_power_data <- read.table(sourcefile, header = TRUE, 
                             sep = ";", stringsAsFactors = FALSE, 
                             dec = ".")

# Subsetting data for specific dates of 1/2/2007 and 2/2/2007
power_data <- all_power_data[all_power_data$Date %in% c("1/2/2007","2/2/2007") ,]

## Plot 1

global_active_power <- as.numeric(power_data$Global_active_power)

## Plot to the file
png("plot1.png", width=480, height=480)
hist(global_active_power,
     col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()