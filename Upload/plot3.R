library(dplyr)
library(data.table)
library(lubridate)

if(!file.exists("./Course41")) {dir.create("./Course41")}
fileUrl ="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./Course41/data.zip", method = "curl")
unzip("./Course41/data.zip",exdir = "./Course41")
setwd("./Course41")
getwd()
data=read.csv("household_power_consumption.txt",sep=";")
data$Date=dmy(data$Date)
newdata=data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]
newdata$Global_active_power=as.numeric(newdata$Global_active_power)
newdata$Sub_metering_1 =as.numeric(newdata$Sub_metering_1 )
newdata$Sub_metering_2 =as.numeric(newdata$Sub_metering_2)
newdata$Sub_metering_3 =as.numeric(newdata$Sub_metering_3)
newdata$DT=paste(newdata$Date,newdata$Time)
newdata$DT=ymd_hms(newdata$DT)
par(mfrow=c(1,1))
plot(newdata$DT,newdata$Sub_metering_1, type="n" , ylab="Global Active Power(kw)",xlab="")
points(newdata$DT,newdata$Sub_metering_1 , type="l" , lwd=2 , col="black" )
points(newdata$DT,newdata$Sub_metering_2 , type="l" , lwd=2 , col="red" )
points(newdata$DT,newdata$Sub_metering_3 , type="l" , lwd=2 , col="blue" )
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,"plot3.png")
dev.off()

