#plot3.R

#We will only be using data from the dates 2007-02-01 and 2007-02-02
#Current date (format) is 16/12/2006 (DD/MM/YYYY); time is 17:24:00 (HH:MM:SS)
#missing values are coded as "?", data is separated with ";"

#Plot 3: Energy Sub-Metering (y) over the 2 days (labeled with day names)
#axes: y = Energy sub metering
#legend with 3 colors (black, red, blue, respectively)

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
png("plot3.png")

#Plot the line graphs for 3 Energy sub meters and add a legend
#initialize plot with first data series
plot(x = feb12data$datetime, y = feb12data$Sub_metering_1, type = "l", 
     col = "black", xlab = NA, ylab = "Energy sub metering")

#add other 2 lines for data series
lines(x = feb12data$datetime, y = feb12data$Sub_metering_2, col = "red")
lines(x = feb12data$datetime, y = feb12data$Sub_metering_3, col = "blue")

legend("topright", legend = colnames(feb12data[7:9]), 
       col = c("black", "red", "blue"), lwd = 1)

#Close the png file device
dev.off()

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#Create a separate R code file that constructs plot1.png 
#Your code file should include code for reading the data so that the plot can be fully reproduced. 
#You must also include the code that creates the PNG file.
#Add the PNG file and R code file to the top-level folder of your git repository 
#(no need for separate sub-folders)

#Convert the Date and Time variables to Date/Time classes in R using the 
#strptime() and as.Date() functions.