data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                 colClasses=c(rep("character",2),rep("numeric",7)))
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
DF<-subset(data, data$Date>=as.Date("2007-02-01")&data$Date<=as.Date("2007-02-02"))

png(filename="plot4.png",width=480, height=480,units="px")
par(mfrow=c(2,2),mar=c(4,4,2,1))
with (DF, {
  plot(DateTime,Global_active_power, type='l',ylab="Global Active Power", xlab="")
  
  plot(DateTime, Voltage, xlab="datetime", type="l")
  
  plot(DF$DateTime, DF$Sub_metering_1,type="l",col="black",xlab="", ylab="Energy sub metering")
  lines(DF$DateTime, DF$Sub_metering_2,col="red")
  lines(DF$DateTime, DF$Sub_metering_3,col="blue")
  legend("topright",pch="-",col=c("black","red","blue"),bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(DateTime, Global_reactive_power,type="l", xlab="datetime")
})
dev.off()