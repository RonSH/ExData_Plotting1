# read file and create plot with subset of data

pwr <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";",
                  colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
                  na.strings = "?")


pwr$Timestamp <- strptime(paste(pwr$Date,pwr$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")

with(subset(pwr, Date == c("1/2/2007","2/2/2007")),plot(Timestamp, Sub_metering_1, 
                                                        xlab = "",
                                                        ylab = "Energy sub metering",
                                                        ylim = c(0,40),
                                                        type = "l"))

with(subset(pwr, Date == c("1/2/2007","2/2/2007")),lines(Timestamp, Sub_metering_2, col = "red"))

with(subset(pwr, Date == c("1/2/2007","2/2/2007")),lines(Timestamp, Sub_metering_3, col = "blue"))

legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file = "plot3.png", width = 480, height = 480)
dev.off()