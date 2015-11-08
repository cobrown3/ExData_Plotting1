#plot4.R

#We will only be using data from the dates 2007-02-01 and 2007-02-02
#Current date (format) is 16/12/2006 (DD/MM/YYYY); time is 17:24:00 (HH:MM:SS)
#missing values are coded as "?", data is separated with ";"

#Plot 4: A panel of 4 different plots (2x2)

#Read data from 2007-02-01 through 2007-02-02
setwd("C:/Users/ASUS/Desktop/Coursera Data Specialization/Exploratory Data Analysis")
skip <- (46*24*60) + (6*60) + 37  #skip the number of rows to get from first row to 2/1
rows <- (2*24*60) #read 2 days of rows
tablecols <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)

feb12data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", 
                        nrows = rows, na.strings = "?", skip = skip)
colnames(feb12data) <- colnames(tablecols)

#Convert date and time into a universal date-time and add columns with date and day
datetime <- paste(feb12data$Date, feb12data$Time)
feb12data$datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S", tz = "GMT")
feb12data$day <- weekdays(as.Date(feb12data$datetime))

#Open png device
png("plot4.png")

#Set up 4-plot format
par(mfcol = c(2,2))

#Plot G_A_P as in Plot 2
plot(x = feb12data$datetime, y = feb12data$Global_active_power, type = "l", 
     xlab = NA, ylab = "Global Active Power")

#Plot sub-metering as in Plot 3
plot(x = feb12data$datetime, y = feb12data$Sub_metering_1, type = "l", 
     col = "black", xlab = NA, ylab = "Energy sub metering")
        lines(x = feb12data$datetime, y = feb12data$Sub_metering_2, col = "red")
        lines(x = feb12data$datetime, y = feb12data$Sub_metering_3, col = "blue")
        legend("topright", legend = colnames(feb12data[7:9]), 
               col = c("black", "red", "blue"), lwd = 1)

#Plot voltage over time
plot(x = feb12data$datetime, y = feb12data$Voltage, type = "l", 
        xlab = "datetime", ylab = "Voltage")

#Plot Global Reactive Power over time
plot(x = feb12data$datetime, y = feb12data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

#Close the png file device
dev.off()

