source("rankFunction.R")

Data <- read.csv(file.choose())
Data2 <- Data[Data$Kind == "Class",]

#Calculate Sum of Data$AvgunitSize

#According to our model we calculate Moderate, High and very High risk
AvgUnitModerate <- Data2[Data2$CountLineCodeDecl < 501 && Data2$CountLineCodeDecl > 301 && Data2$CountLineCodeExe < 501 && Data2$CountLineCodeExe > 301,]
AvgUnitHigh <- Data2[Data2$CountLineCodeDecl < 1000 && Data2$CountLineCodeDecl > 500 && Data2$CountLineCodeExe < 1000 && Data2$CountLineCodeExe > 500,]
AvgUnitVeryHigh <- Data2[Data2$CountLineCodeDecl > 1000 & Data2$CountLineCodeExe > 1000,]

Data2LOC <- sum(Data2$CountLineCodeDecl) + sum(Data2$CountLineCodeExe)
AvgUnitModerateLOC <- sum(AvgUnitModerate$CountLineCodeDecl) + sum(AvgUnitModerate$CountLineCodeExe)
AvgCyclomaticHighLOC <- sum(AvgUnitHigh$CountLineCodeDecl) + sum(AvgUnitHigh$CountLineCodeExe)
AvgUnitVeryHighLOC <- sum(AvgUnitVeryHigh$CountLineCodeDecl) + sum(AvgUnitVeryHigh$CountLineCodeExe)

AvgUnitModeratePercentage <- (AvgUnitModerateLOC/Data2LOC) * 100
AvgUnitHighPercentage <- (AvgCyclomaticHighLOC/Data2LOC) * 100
AvgUnitVeryHighPercentage <- (AvgUnitVeryHighLOC/Data2LOC) * 100
Mean <- (AvgUnitModeratePercentage + AvgUnitHighPercentage + AvgUnitVeryHighPercentage ) /3
Mean

#call rankMRLOC() 
rankResult <- rankMRLOC(AvgUnitModeratePercentage, AvgUnitHighPercentage, AvgUnitVeryHighPercentage)

