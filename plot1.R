#plot1.R

#We will only be using data from the dates 2007-02-01 and 2007-02-02
#Current date (format) is 16/12/2006 (DD/MM/YYYY); time is 17:24:00 (HH:MM:SS)
#missing values are coded as "?", data is separated with ";"

#Plot 1: Histogram with red bars and ~12 bins
#Title = Global Active Power; axes: x = Global Active Power (kilowatts)

#Read data from 2007-02-01 through 2007-02-02
setwd("C:/Users/ASUS/Desktop/Coursera Data Specialization/Exploratory Data Analysis")
skip <- (46*24*60) + (6*60) + 37  #skip the number of rows to get from first row to 2/1
rows <- (2*24*60) #read 2 days of rows
tablecols <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
                        
feb12data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", 
                        nrows = rows, na.strings = "?", skip = skip)
colnames(feb12data) <- colnames(tablecols)

#Open png device
png("plot1.png")

#Plot the histogram for Global Active Power
hist(feb12data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

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