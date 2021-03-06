data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                 colClasses=c(rep("character",2),rep("numeric",7)))
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
DF<-subset(data, data$Date>=as.Date("2007-02-01")&data$Date<=as.Date("2007-02-02"))

png(filename="plot2.png",width=480, height=480,units="px")
plot(DF$DateTime,DF$Global_active_power, type='l',ylab="Global Active Power (klowatts)", xlab="")
dev.off()