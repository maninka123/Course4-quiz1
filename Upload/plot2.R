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
newdata$DT=paste(newdata$Date,newdata$Time)
newdata$DT=ymd_hms(newdata$DT)
plot(newdata$Voltage~newdata$DT , type="l" , lwd=2 , col="black" , ylab="Voltage",xlab="datetime")
#ggplot(data = newdata, aes(x = DT, y = Global_active_power)) + geom_line(color = "black", size = 1)+labs(y="Global Active Power(kw)")
dev.copy(png,"plot2.png")
dev.off()    
