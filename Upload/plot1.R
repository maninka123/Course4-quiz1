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
with(newdata,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(killowatts)"))
dev.copy(png,"plot1.png")
dev.off()
