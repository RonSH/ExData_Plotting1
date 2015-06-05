# read file and create plot with subset of data

pwr <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";",
                  colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
                  na.strings = "?")

with(subset(pwr, Date == c("1/2/2007","2/2/2007")),hist(Global_active_power, 
     # breaks = c(0.5),                                          
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     xlim = c(0,6),
     col = "red"))

dev.copy(png,file = "plot1.png", width = 480, height = 480)
dev.off()