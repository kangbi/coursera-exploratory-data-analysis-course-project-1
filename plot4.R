orgdata<-read.table("/Users/joonkim/work/2020_JohnsHopkins/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
mydata<-orgdata[data$Date %in% c("1/2/2007","2/2/2007"), ]
dt<-strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP<-as.numeric(mydata$Global_active_power)

subMetering1 <- as.numeric(mydata$Sub_metering_1)
subMetering2 <- as.numeric(mydata$Sub_metering_2)
subMetering3 <- as.numeric(mydata$Sub_metering_3)
vt<-as.numeric(mydata$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dt, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dt, vt, type="l", xlab="datetime", ylab="Voltage")
plot(dt, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dt, GAP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
