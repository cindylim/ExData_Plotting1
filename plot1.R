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

#Plot histogram of Global Active Power and save to png file
png("plot1.png, width = 480, height = 480, units = "px")
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
