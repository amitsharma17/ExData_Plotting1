#Read file after downloading in working directory
DF<-read.csv("household_power_consumption.txt",sep=";",na.strings ="?",header=TRUE)

#Change time from character to POSIXlt using strptime()
DF$Time <- paste(DF$Date,DF$Time,sep = " ")
DF$Time <- strptime(DF$Time,"%d/%m/%Y %H:%M:%S")
#Change Date to class Date using as.Date()
DF$Date<-as.Date(DF$Date,"%d/%m/%Y")

#Subset data for two days
DF1 <- subset(DF,DF$Date %in% as.Date(c("2007-02-01","2007-02-02")))

#plot 2
png("plot2.png")
plot(DF1$Time,DF1$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()
