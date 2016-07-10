#plot4
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
png(filename="plot4.png")

#create plot
par(mfrow=c(2,2))
#1
with(pow,plot(datetime,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
#2
with(pow,plot(datetime,Voltage,type="l",ylab="Voltage"))
#3
with(pow,plot(datetime,Sub_metering_1,type="l",ylab="Energy Sub metering",xlab=""))
with(pow,lines(datetime,Sub_metering_2,col="red"))
with(pow,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2,2,2),col=c("black","red","blue"))
#4
with(pow,plot(datetime,Global_reactive_power,type="l"))

#turn off device
dev.off()