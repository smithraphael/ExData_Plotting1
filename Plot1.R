# read file from Working Directory

file = "household_power_consumption.txt"
data_file = read.table(file, header = TRUE, sep = ";", na.strings = "?")

use_data = na.omit(data_file)

# Format data properly

use_data$Time = strptime(paste(use_data$Date, use_data$Time), "%d/%m/%Y %H:%M:%S")
use_data$Date = as.Date(use_data$Date, format = "%d/%m/%Y")


# Define subset for 2007-02-01 and 2007-02-01

sub_data_file_1 = subset(use_data, Date == "2007-02-01", select = c("Date","Global_active_power"))
sub_data_file_2 = subset(use_data, Date == "2007-02-02", select = c("Date","Global_active_power"))

sub_data_file = rbind(sub_data_file_1, sub_data_file_2)


# Create histogram and generate PNG file


png(filename = "plot1.png", width = 480, height = 480)

hist(sub_data_file$Global_active_power, col = "red", main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)")

dev.off()
