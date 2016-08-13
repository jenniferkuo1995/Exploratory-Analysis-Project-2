library("ggplot2")

#read raw data into data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#logical vector corresponding to motor-vehicle related SCCs
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE) & 
     !(grepl("equipment", SCC$SCC.Level.Three, ignore.case = TRUE))
#subset of relevant SCCs
subSCC <- SCC[vehicles,]$SCC

#subset of data from Baltimore and LA, with motor vehicle-related emissions
NEIsub1 <- NEI[NEI$fips %in% c ('24510','06037'),] 
NEIsub2 <- NEIsub1[NEIsub1$SCC %in% subSCC,]

#rename area codes to city names
NEIsub2$fips[NEIsub2$fips == '06037'] <- 'Los Angelos'
NEIsub2$fips[NEIsub2$fips == '24510'] <- 'Baltimore'

png('plot6.png') #initialize graphics device

plot6 <- ggplot(NEIsub2,aes(factor(year),Emissions)) + #initialize graph
     geom_bar(stat="identity") + 
     ggtitle(expression("Comparing Motor-vehicle PM"[2.5]*" Emissions from LA and Baltimore")) +
     ylab('Emissions (ton)') + xlab('Year') +
     facet_grid(.~fips) #make two barplots, separated by location

plot6 #print plot
dev.off()