temp<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
#temp$Date<-as.Date(temp$Date, format="%d/%m/%Y")
temp2 <- temp[temp$Date %in% c("1/2/2007","2/2/2007") ,]
temp3<-paste(temp2$Date, temp2$Time)
x<-strptime(temp3, "%d/%m/%Y %H:%M:%S")
temp2$Global_active_power <- as.numeric(temp2$Global_active_power)

png("plot3.png")
plot(x,temp2$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(x,temp2$Sub_metering_2, type="l", col="red")
lines(x,temp2$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red", "blue"))
dev.off()

