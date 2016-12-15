## read file
library(ggplot2)
library(data.table)
library(dplyr)
library(lubridate)
setwd('coursera')
# make sure the inptu files are in the working directory. 
cn<-c("Date" , "Time" , "Global_active_power","Global_reactive_power","Voltage" ,"Global_intensity" 
      ,"Sub_metering_1","Sub_metering_2" ,"Sub_metering_3"  )

hh.power.con<-fread("household_power_consumption.txt") %>% 
  filter(Date == '2/1/2007' | Date=='2/2/2007' ) 
##hh.power.con$DateTime<-paste(hh.power.con$Date,hh.power.con$Time,sep = ' ')
hh.power.con$DateTime<-strptime(paste(hh.power.con$Date,hh.power.con$Time,sep = ' '),"%m/%d/%Y %H:%M:%S")
##hh.power.con$Date <- as.Date(hh.power.con$Date,"%m/%d/%Y")

##hh.power.con$Time <- strptime(hh.power.con$Time,"%H:%M:%S")
plot(hh.power.con$DateTime,hh.power.con$Global_active_power,type="l",
    ylab='Global Active Power (kilowatts)',main='Global Active Power',xlab = '')
dev.copy(png,file='exploratoryanalysis/plot2.png')
dev.off()
