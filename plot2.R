# read file and create plot with subset of data

pwr <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";",
                  colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
                  na.strings = "?")


pwr$Timestamp <- strptime(paste(pwr$Date,pwr$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")

with(subset(pwr, Date == c("1/2/2007","2/2/2007")),plot(Timestamp, Global_active_power, 
                                                        xlab = "",
                                                        ylab = "Global Active Power (kilowatts)",
                                                        ylim = c(0,6),
                                                        type = "l"))

dev.copy(png,file = "plot2.png", width = 480, height = 480)
dev.off()