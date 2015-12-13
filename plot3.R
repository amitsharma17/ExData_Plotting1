#Read file after downloading in working directory
DF<-read.csv("household_power_consumption.txt",sep=";",na.strings ="?",header=TRUE)

#Change time from character to POSIXlt using strptime()
DF$Time <- paste(DF$Date,DF$Time,sep = " ")
DF$Time <- strptime(DF$Time,"%d/%m/%Y %H:%M:%S")
#Change Date to class Date using as.Date()
DF$Date<-as.Date(DF$Date,"%d/%m/%Y")

#Subset data for two days
DF1 <- subset(DF,DF$Date %in% as.Date(c("2007-02-01","2007-02-02")))

#plot 3
png("plot3.png")
plot(DF1$Time,DF1$Sub_metering_1, type = "l",ylab = "Energy sub metering",xlab = "")
lines(DF1$Time,DF1$Sub_metering_2,col = "red")
lines(DF1$Time,DF1$Sub_metering_3,col = "blue")
legend("topright",pch = 1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
