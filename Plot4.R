## Plot4
##Reading the data and subseting the dates 2007-02-01 and 2007-02-02
datos = read.table("household_power_consumption.txt", header=TRUE, 
                   sep=";", na.strings = "?")
filtrados <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

##Converting the Date and Time variables to Date/Time classes
filtrados$Date_Time = dmy_hms(paste(filtrados$Date, filtrados$Time)) 

##Saving plot to a PNG file
png(file="plot4.png",width=480,height=480, units="px")

##Setting up the plot space for four plots 
par(mfcol = c(2,2))

##Making plots
##P1
plot(filtrados$Date_Time, filtrados$Global_active_power, 
     type="l", ylab="Global Active Power", xlab="")


##P2
with(filtrados, plot(Date_Time, Sub_metering_1,
                     ylab="Energy sub metering", xlab="", type = "l"))

with(filtrados, points(Date_Time, Sub_metering_2, col = "red", type="l"))

with(filtrados, points(Date_Time, Sub_metering_3, col = "blue", type="l"))

legend("topright", pch = "__", col = c("black","red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

##P3
plot(filtrados$Date_Time, filtrados$Voltage, 
     type="l", ylab="Voltage", xlab="datetime")


##P4
plot(filtrados$Date_Time, filtrados$Global_reactive_power, 
     type="l", ylab="Global_reactive_power", xlab="datetime")

##Closing the device
dev.off()

