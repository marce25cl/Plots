## Plot2
##Reading the data and subseting the dates 2007-02-01 and 2007-02-02
datos = read.table("household_power_consumption.txt", header=TRUE, 
                   sep=";", na.strings = "?")
filtrados <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

##Converting the Date and Time variables to Date/Time classes
filtrados$Date_Time = dmy_hms(paste(filtrados$Date, filtrados$Time)) 

##Saving plot to a PNG file
png(file="plot2.png",width=480,height=480, units="px")

##Making plot
plot(filtrados$Date_Time, filtrados$Global_active_power, 
     type="l", ylab="Global Active Power (kilowatts)", xlab="")

##Closing the device
dev.off()
