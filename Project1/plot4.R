
setwd("C:\\Raphael\\estudos\\datasciencecoursera\\Exploratory Data Analysis\\Week 1")
file = "household_power_consumption.txt"

# read file from Working Directory

data_file = read.table(file, header = TRUE, sep = ";", na.strings = "?")
use_data = na.omit(data_file)

# Format data properly

use_data$Time = strptime(paste(use_data$Date, use_data$Time), "%d/%m/%Y %H:%M:%S")
use_data$Date = as.Date(use_data$Date, format = "%d/%m/%Y")


# Define subset for 2007-02-01 and 2007-02-01

sub_data_file_1 = subset(use_data, Date == "2007-02-01", 
                         select = c("Time","Sub_metering_1",
                                    "Sub_metering_2",
                                    "Sub_metering_3",
                                    "Global_active_power",
                                    "Global_reactive_power",
                                    "Voltage"))

sub_data_file_2 = subset(use_data, Date == "2007-02-02", 
                         select = c("Time","Sub_metering_1",
                                    "Sub_metering_2",
                                    "Sub_metering_3",
                                    "Global_active_power",
                                    "Global_reactive_power",
                                    "Voltage"))

sub_data_file = rbind(sub_data_file_1, sub_data_file_2)


# Plot 4 graphics
# Generate PNG file
# Note: QUI = THU, SEX = FRI, SAB = SAT (My R is in Portuguese, instead of English)



png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2)) 

# 1
plot(sub_data_file$Time, sub_data_file$Global_active_power, 
     ylab = "Global Active Power", xlab = "", type = "l")

# 2
plot(sub_data_file$Time, sub_data_file$Voltage, 
     ylab = "Voltage", xlab = "datetime", type = "l")

# 3
plot(sub_data_file$Time, sub_data_file$Sub_metering_1, col = "black",
     type = "l", ylab = "Energy sub metering", xlab = "")


lines(sub_data_file$Time, sub_data_file$Sub_metering_2, col = "red",type = "l")

lines(sub_data_file$Time, sub_data_file$Sub_metering_3, col = "blue", type = "l")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col=c("black", "red", "blue"), bty = "n")

# 4
plot(sub_data_file$Time, sub_data_file$Global_reactive_power, 
     ylab = "Global_reactive_power", xlab = "datetime", type = "l")



dev.off()
