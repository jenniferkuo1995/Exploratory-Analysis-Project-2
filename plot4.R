library("ggplot2")

#read raw data into data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#create a subset of NEI with rows from coal combustion related emissions
coalcomb <- grepl('Comb', SCC$EI.Sector) & #make logical vector corresponding to target sources
     grepl('Coal', SCC$EI.Sector)
SCCsub <- SCC[coalcomb,]$SCC               #subset of SCC
NEIsub <-NEI[NEI$SCC %in% SCCsub,]         #subset of NEI

png('plot4.png')
plot4 <- ggplot(NEIsub,aes(factor(year),Emissions)) + #initialize graph
     geom_bar(stat="identity") +                      #make barplot
     ggtitle(expression("Overall PM"[2.5]*" Emissions from Coal-Combustion Sources")) + #add title
     ylab('Emissions (ton)') + xlab('Year')           #add x & y labels

plot4 #print plot
dev.off()