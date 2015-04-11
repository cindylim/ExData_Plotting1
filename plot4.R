#Clear the memory from previous R session
rm(list=ls())

#Increase memory size limit in 64-bit 
memory.limit(size=8000000)

#Set working directory to where data file is saved
setwd("C:/Users/Home/Desktop/Coursera/4. Exploratory Data Analysis/Course Project 1/")

#Read data file into R
full.data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",as.is=TRUE,na.strings="?")
head(full.data)

#Create a variable with both Date and Time in it
full.data$Date.Time<-paste(full.data$Date,full.data$Time,sep=" ")

#Convert Date and Time variables to Date/Time classes
full.data$Date<-as.Date(full.data$Date,"%d/%m/%Y")
full.data$Date.Time<-strptime(full.data$Date.Time,"%d/%m/%Y %H:%M:%S")
head(full.data)

#Subset required data
data<-full.data[full.data$Date=="2007-02-01" | full.data$Date=="2007-02-02",]
head(data)

#Plot the 4 time series and save to png
png("plot4.png", width = 480, height = 480, units = "px")

#Create plot session with 4 panels (2 rows and 2 columns)
par(mfrow=c(2,2))

#Plot first time series on Global active power
plot(data$Date.Time,data$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power")

#Plot second time series on Voltage
plot(data$Date.Time,data$Voltage,type="l",main="",xlab="datetime",ylab="Voltage")

#Plot third time series on the three energy sub metering
plot(data$Date.Time,data$Sub_metering_1,type="l",main="",ylab="Energy sub metering", xlab="")
lines(data$Date.Time,data$Sub_metering_2,col="red")
lines(data$Date.Time,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

#Plot fourth time series on Global reactive power
plot(data$Date.Time,data$Global_reactive_power,type="l",main="",xlab="datetime",ylab="Global_reactive_power")

dev.off()

