#plot2
library(lubridate)

setwd("F:/Dropbox/Coursera_Data_Sci/R_Working_Dir/Exploratory Data Analysis/Week 1")
#read data
pow <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
#convert Date to correct format
pow$Date <- dmy(pow$Date)
#subset to only the required timeframe
pow <- subset(pow,Date=="2007-02-01" | Date=="2007-02-02")
#create a datetime column
datetime <- paste(pow$Date,pow$Time)
pow$datetime <- parse_date_time(datetime,'Ymd HMS')


#open device
png(filename="plot2.png")
#create plot
with(pow,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
#turn off device
dev.off()