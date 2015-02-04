
setwd("C:\\Raphael\\estudos\\datasciencecoursera\\Exploratory Data Analysis\\Week 1")
file = "household_power_consumption.txt"

# read file from Working Directory

data_file = read.table(file, header = TRUE, sep = ";", na.strings = "?")
use_data = na.omit(data_file)

# Format data properly

use_data$Time = strptime(paste(use_data$Date, use_data$Time), "%d/%m/%Y %H:%M:%S")
use_data$Date = as.Date(use_data$Date, format = "%d/%m/%Y")


# Define subset for 2007-02-01 and 2007-02-01

sub_data_file_1 = subset(use_data, Date == "2007-02-01", select = c("Time","Global_active_power"))
sub_data_file_2 = subset(use_data, Date == "2007-02-02", select = c("Time","Global_active_power"))

sub_data_file = rbind(sub_data_file_1, sub_data_file_2)


# Plot Time and  Global Active Power
# Generate PNG file
# Note: QUI = THU, SEX = FRI, SAB = SAT (My R is in Portuguese, instead of English)


png(filename = "plot2.png", width = 480, height = 480)

plot(sub_data_file$Time, sub_data_file$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

dev.off()
