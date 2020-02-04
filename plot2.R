
orgdata<-read.table("/Users/joonkim/work/2020_JohnsHopkins/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
mydata<-orgdata[data$Date %in% c("1/2/2007","2/2/2007"), ]
dt<-strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP<-as.numeric(mydata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dt, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
