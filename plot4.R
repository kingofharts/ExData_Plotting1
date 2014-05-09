## read and format selected data from provided source

hpc <- read.table("household_power_consumption.txt",skip = 66637,nrow = 2880,sep = ";",col.names = colnames(read.table("household_power_consumption.txt",nrow = 1,header = TRUE,sep=";")),na.strings = "?")
hpc.c <- paste(hpc$Date,hpc$Time,sep=" ")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$Time <- strptime(hpc.c, format = "%d/%m/%Y %H:%M:%S")

## open png device, set new plot

png(file = "plot4.png", width=480, height = 480, bg="transparent")

plot.new()

## arrange multi-plot layout

par(mfrow = c(2,2), mar = c(4,4,2,1))

## create plots

with(hpc, {
     
      ## U.L. Plot
     
      plot(
            Global_active_power,
            xlab="",
            ylab = "Global Active Power",
            pch="",
            type="l",
            bg="transparent",
            xaxt="n",
            
      )
      
      axis(
            1, 
            at=c(1, 1440, 2880),
            labels=c("Thu", "Fri", "Sat")
      )

      ## U.R. Plot
      
      plot(
            Voltage,
            xlab="datetime",
            ylab = "Voltage",
            pch="",
            type="l",
            bg="transparent",
            xaxt="n",
            
      )
      
      axis(
            1, 
            at=c(1, 1440, 2880),
            labels=c("Thu", "Fri", "Sat")
      )
      
      ## L.L. Plot

      plot(
            Sub_metering_1,
            xlab="",
            ylab = "Energy sub metering",
            pch="",
            type="l",
            bg="transparent",
            xaxt="n"
            
      )  
      
      lines(
            hpc$Sub_metering_2,
            type="l",
            col="red"
      )

      lines(
            hpc$Sub_metering_3,
            type="l",
            col="blue"
      )

      axis(
            1, 
            at=c(1, 1440, 2880),
            labels=c("Thu", "Fri", "Sat")
      )


      legend(
            "topright",
            lty=c(1,1,1),
            col=c("black","red","blue"),
            legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            bty="n"
            )

      ## L.R. Plot
      
      plot(
            Global_reactive_power,
            xlab="datetime",
            pch="",
            type="l",
            bg="transparent",
            xaxt="n",
            
      )
      
      axis(
            1, 
            at=c(1, 1440, 2880),
            labels=c("Thu", "Fri", "Sat")
      )
      
})

## close png device

dev.off()
