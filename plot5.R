library("ggplot2")

#read raw data into data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#logical vector corresponding to motor-vehicle related SCCs
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE) & 
     !(grepl("equipment", SCC$SCC.Level.Three, ignore.case = TRUE))
#subset of relevant SCCs
subSCC <- SCC[vehicles,]$SCC

#subset of Baltimore data with the relevant emissions sources.
NEIBalt <- NEI[NEI$fips == '24510',]
NEIsub <- NEIBalt[NEIBalt$SCC %in% subSCC,]

png('plot5.png') #initialize graphics device

plot5 <- ggplot(NEIsub,aes(factor(year),Emissions)) + #initialize graph
     geom_bar(stat="identity") + 
     ggtitle(expression("PM"[2.5]*" Emissions from Motor Vehicles in Baltimore")) +
     ylab('Emissions (ton)') + xlab('Year')

plot5 #print plot

dev.off()