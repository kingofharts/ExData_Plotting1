## read and format selected data from provided source

      hpc <- read.table("household_power_consumption.txt",skip = 66637,nrow = 2880,sep = ";",col.names = colnames(read.table("household_power_consumption.txt",nrow = 1,header = TRUE,sep=";")),na.strings = "?")
      hpc.c <- paste(hpc$Date,hpc$Time,sep=" ")
      hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
      hpc$Time <- strptime(hpc.c, format = "%d/%m/%Y %H:%M:%S")

## open png device
      
      png(file = "plot1.png", width=480, height = 480, bg="transparent")
      
## create plot

      with(hpc, hist(hpc$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", bg="transparent", main = "Global Active Power"))
      
## close png device
      
      dev.off()
      
      