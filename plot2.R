temp<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
#temp$Date<-as.Date(temp$Date, format="%d/%m/%Y")
temp2 <- temp[temp$Date %in% c("1/2/2007","2/2/2007") ,]
temp3<-paste(temp2$Date, temp2$Time)
x<-strptime(temp3, "%d/%m/%Y %H:%M:%S")
temp2$Global_active_power <- as.numeric(temp2$Global_active_power)

png("plot12.png")
plot(x,temp2$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


