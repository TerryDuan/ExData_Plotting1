##the wording dir is set to default, so need redirect to where raw data located
plot3 <- function(){
  data <- read.csv("~/myR/data/household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)
  data2<- tbl_df(data)
  data3<-data2[data2["Date"] == "1/2/2007" | data2["Date"] == "2/2/2007",]
  data3<-data3[data3["Global_active_power"] != "?",]
  cols <- c("Date", "Time")
  data3$Day <- apply(data3[,cols],1, paste, collapse = " ")
  data3$Day <- strptime(data3$Day, "%d/%m/%Y %H:%M:%S")
  Sub1 <- as.numeric(data3$Sub_metering_1)
  plot(data3$Day, data3$Sub_metering_1, ylim = range(Sub1),lines(data3$Day, data3$Sub_metering_1) , pch = "", xlab = "", ylab = "Global Active Power (kilowatts)")
  par(new = TRUE)
  plot(data3$Day, data3$Sub_metering_3, ylim = range(Sub1),lines(data3$Day, data3$Sub_metering_3, col = "blue") , pch = "", xlab = "", ylab = "Global Active Power (kilowatts)")
  par(new = TRUE)
  plot(data3$Day, data3$Sub_metering_2, ylim = range(Sub1),lines(data3$Day, data3$Sub_metering_2, col = "red") , pch = "", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = c(1,1,1), col = c("black", "red", "blue"))
  
  dev.copy(png, "plot3.png")
  dev.off()
}