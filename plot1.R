#Plot1
#Histogram for Global Active Power on 2007-01-01 and 2007-02-02

#Read file after downloading in working directory
DF<-read.csv("household_power_consumption.txt",sep=";",na.strings ="?",header=TRUE)

#Change time from character to POSIXlt using strptime()
DF$Time <- paste(DF$Date,DF$Time,sep = " ")
DF$Time <- strptime(DF$Time,"%d/%m/%Y %H:%M:%S")
#Change Date to class Date using as.Date()
DF$Date<-as.Date(DF$Date,"%d/%m/%Y")

#Subset data for two days
DF1 <- subset(DF,DF$Date %in% as.Date(c("2007-02-01","2007-02-02")))

png("plot1.png")
#create the plot 1
hist(DF1$Global_active_power,ylab = "Frequency",xlab = "Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.off()