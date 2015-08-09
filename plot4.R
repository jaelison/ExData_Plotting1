# Peer Assessments /Course Project 1

##########################################################
### Run this code for cleaning up the original dataset ###
### and create you working project dataset             ###
##########################################################   


	# Load dataset
		epcOriginal = read.table("household_power_consumption.txt", header=TRUE, sep=";") 
		#View(epcOriginal)
	# Create a new dataset to apply data filters
		epcSubset = epcOriginal 
		# Update the date variable	
		epcSubset$Date = as.Date(epcSubset$Date,  format="%d/%m/%Y")
		# Update the time variable
		epcSubset$Time = strptime(epcSubset$Time, "%H:%M:%S")
	# Filter from the origianl dataset dates "2007-02-01" and "2007-02-02"
		epc = subset(epcSubset, Date=="2007-02-01" | Date=="2007-02-02")

	# Write the filtered file for future use
		write.csv(epc, "epc.csv")

#######################################################
### Use the code below to load the adjusted dataset ###
### and proceed with the project requirements       ###
#######################################################

	epc = read.csv("epc.csv")
	View(epc)

	# Update the date variable	
	epc$Date = as.Date(epc$Date,  format="%Y-%m-%d")

	# Update the time variable
	epc$Time = strptime(epc$Time, "%Y-%m-%d %H:%M:%S")

	# Create a new column DateTime joining Date and Time in one single variable
	epcpaste  = strftime(paste(epc$Date,strftime(epc$Time, format="%H:%M:%S"), sep=" "))
	epcconvert = as.POSIXct(epcpaste  , format = "%Y-%m-%d %H:%M:%S")
	epc$DateTime = epcconvert 

	# Showing the result
	str(epc)

########################
### Plotting results ###
########################



# Plot 4

	par(mfrow=c(2,2))
	plot(epc$DateTime, epc$Global_active_power, type="o", pch=21, cex=0, xlab="", ylab="Global Active Power")
	plot(epc$DateTime, epc$Voltage, type="o", pch=21, cex=0, xlab="datetime", ylab="Voltage")
	plot(epc$Sub_metering_1 ~ epc$DateTime , type="o", pch=21, cex=0, xlab="", ylab="Energy sub metering")
	points(epc$Sub_metering_2 ~ epc$DateTime , type="o", pch=21, cex=0, xlab="", ylab="", col="red")
	points(epc$Sub_metering_3 ~ epc$DateTime , type="o", pch=21, cex=0, xlab="", ylab="", col="blue")
	legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=2, col=c("black","red","blue"))
	plot(epc$DateTime, epc$Global_reactive_power, type="o", pch=21, cex=0, xlab="datetime", ylab="Global_reactive_power")

	png(file = "plot4.png",width = 480, height = 480)
	par(mfrow=c(2,2))
	plot(epc$DateTime, epc$Global_active_power, type="o", pch=21, cex=0, xlab="", ylab="Global Active Power")
	plot(epc$DateTime, epc$Voltage, type="o", pch=21, cex=0, xlab="datetime", ylab="Voltage")
	plot(epc$Sub_metering_1 ~ epc$DateTime , type="o", pch=21, cex=0, xlab="", ylab="Energy sub metering")
	points(epc$Sub_metering_2 ~ epc$DateTime , type="o", pch=21, cex=0, xlab="", ylab="", col="red")
	points(epc$Sub_metering_3 ~ epc$DateTime , type="o", pch=21, cex=0, xlab="", ylab="", col="blue")
	legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=2, col=c("black","red","blue"))
	plot(epc$DateTime, epc$Global_reactive_power, type="o", pch=21, cex=0, xlab="datetime", ylab="Global_reactive_power")
	dev.off()



