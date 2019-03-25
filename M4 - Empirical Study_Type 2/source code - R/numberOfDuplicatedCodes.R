setwd("//home//ec2-user//SoftwareMeasurement6611_winter2019//SciTools_Libreoffice_metrics//duplicationReport")
files <- c("report1.csv", "report2.csv")
dupreport <- data.frame()

calcDup <- function(x){
	data <- read.table(x, sep=",", fill=TRUE, header = TRUE, col.name=c("v1", "v2", "v3", 1:no_col))
	summation <- sum(data$v3)
	dupreport <- rbind(dupreport,summation))
}

#x <- "report1.csv"
#calcDup(x)

sapply(files, calcDup)
write.csv(dupreport, file = "dupreport.csv")



