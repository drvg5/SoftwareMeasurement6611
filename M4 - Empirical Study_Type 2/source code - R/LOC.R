Data <- read.csv(file.choose())
Data2 <- Data[Data$Kind == "Class",]
Data2LOC <- sum(Data2$CountLineCodeDecl) + sum(Data2$CountLineCodeExe)
Data2LOC()