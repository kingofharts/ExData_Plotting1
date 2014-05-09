## read and format selected data from provided source

hpc <- read.table("household_power_consumption.txt",skip = 66637,nrow = 2880,sep = ";",col.names = colnames(read.table("household_power_consumption.txt",nrow = 1,header = TRUE,sep=";")),na.strings = "?")
hpc.c <- paste(hpc$Date,hpc$Time,sep=" ")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$Time <- strptime(hpc.c, format = "%d/%m/%Y %H:%M:%S")

## open png device

png(file = "plot2.png", width=480, height = 480, bg="transparent")

plot.new()

## create plot

with(
        hpc, plot(
                Global_active_power,
                xlab="",
                ylab = "Global Active Power (kilowatts)",
                pch="",
                type="l",
                bg="transparent",
                xaxt="n",
                
        )
)

axis(
                1, 
                at=c(1, 1440, 2880),
                labels=c("Thu", "Fri", "Sat")
        )
        
## close png device

dev.off()

