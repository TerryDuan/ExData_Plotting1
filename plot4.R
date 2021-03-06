##the wording dir is set to default, so need redirect to where raw data located
plot4 <- function(){
  source('~/myR/plot3.R')
  data <- read.csv("~/myR/data/household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)
  data2<- tbl_df(data)
  data3<-data2[data2["Date"] == "1/2/2007" | data2["Date"] == "2/2/2007",]
  data3<-data3[data3["Global_active_power"] != "?",]
  cols <- c("Date", "Time")
  data3$Day <- apply(data3[,cols],1, paste, collapse = " ")
  data3$Day <- strptime(data3$Day, "%d/%m/%Y %H:%M:%S")
  par(mfrow = c(2,2))
  plot(data3$Day, data3$Global_active_power, lines(data3$Day, data3$Global_active_power) , pch = "", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  plot(data3$Day, data3$Voltage,lines(data3$Day, data3$Voltage) , pch = "", xlab = "", ylab = "Voltage")
  plot3()
  plot(data3$Day, data3$Global_reactive_power,lines(data3$Day, data3$Global_reactive_power) , pch = "", xlab = "", ylab = "Global_reactive_power")
  dev.copy(png, "plot4.png")
  dev.off()
}