source("rankFunction.R")

Data <- read.csv(file.choose())
Data2 <- Data[Data$Kind == "Class",]

#Calculate Sum of Data$AvgCyclomatic

#According to our model we calculate Moderate, High and very High risk
AvgCyclomaticModerate <- Data2[Data2$AvgCyclomatic > 10 & Data2$AvgCyclomatic < 21,]
AvgCyclomaticHigh <- Data2[Data2$AvgCyclomatic > 20 & Data2$AvgCyclomatic < 51,]
AvgCyclomaticVeryHigh <- Data2[Data2$AvgCyclomatic > 50,]

Data2LOC <- sum(Data2$CountLineCodeDecl) + sum(Data2$CountLineCodeExe)
AvgCyclomaticModerateLOC <- sum(AvgCyclomaticModerate$CountLineCodeDecl) + sum(AvgCyclomaticModerate$CountLineCodeExe)
AvgCyclomaticHighLOC <- sum(AvgCyclomaticHigh$CountLineCodeDecl) + sum(AvgCyclomaticHigh$CountLineCodeExe)
AvgCyclomaticVeryHighLOC <- sum(AvgCyclomaticVeryHigh$CountLineCodeDecl) + sum(AvgCyclomaticVeryHigh$CountLineCodeExe)

AvgCyclomaticModeratePercentage <- (AvgCyclomaticModerateLOC/Data2LOC) * 100
AvgCyclomaticHighPercentage <- (AvgCyclomaticHighLOC/Data2LOC) * 100
AvgCyclomaticVeryHighPercentage <- (AvgCyclomaticVeryHighLOC/Data2LOC) * 100
Mean <- (AvgCyclomaticModeratePercentage + AvgCyclomaticHighPercentage + AvgCyclomaticVeryHighPercentage) /3
Mean

#call rankMRLOC() 
rankResult <- rankMRLOC(AvgCyclomaticModeratePercentage, AvgCyclomaticHighPercentage, AvgCyclomaticVeryHighPercentage)

