## Plot1
##Reading the data and subseting the dates 2007-02-01 and 2007-02-02
datos = read.table("household_power_consumption.txt", header=TRUE, 
                   sep=";", na.strings = "?")
filtrados <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

##Saving plot to a PNG file
png(file="plot1.png",width=480,height=480, units="px")

##Making histogram 
hist(filtrados$Global_active_power, col="red", 
     main="Global Active Power", xlab= "Global Active Power (kilowatts)")

##Closing the device
dev.off()