##the wording dir is set to default, so need redirect to where raw data located
plot1 <- function(){
  data <- read.csv("~/myR/data/household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)
  data2<- tbl_df(data)
  data3<-data2[data2["Date"] == "1/2/2007" | data2["Date"] == "2/2/2007",]
  data3<-data3[data3["Global_active_power"] != "?",]
  gap<-data3["Global_active_power"]
  gap2 <- as.numeric(unlist(gap))
  hist(gap2, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
  dev.copy(png, "plot1.png")
}
