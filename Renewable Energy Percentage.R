setwd("C:/Users/admin/Box/Harris Hub/Chicago Policy Review/Data Visualization/MyDataVizProject/data")
install.packages("RColorBrewer")
install.packages("rworldmap")

library(RColorBrewer)
library(rworldmap)
library(readxl)
library(tidyverse)
library(dplyr)
rm(list = ls()) #Clear the environment

#Data Source: https://data.worldbank.org/indicator/EG.ELC.RNEW.ZS

powerdata <- read_xlsx("Electricity Output.xlsx")
View(powerdata)

#1990 data
powerdata <- aggregate(powerdata$`1990`,by=list(Country=powerdata$`Country Name`),FUN=sum)
colnames(powerdata)[colnames(powerdata)=="x"] <- "1990 Renewable Electricity Percentage of Total Electricity Output"

RenewableElectricityOutput <- joinCountryData2Map(powerdata,
                                              nameJoinColumn = "Country",
                                              joinCode = "NAME")
#Set the color palette with RColorBrewer:
#colourPalette <- RColorBrewer::brewer.pal(10,"Spectral") #Purples
#colourPalette <- RColorBrewer::brewer.pal(9,"BuPu") #Purples
colourPalette <- RColorBrewer::brewer.pal(10,"RdBu") #Purples


#Plot the map using mapCountryData function from rworldmap:
mapCountryData(RenewableElectricityOutput,
               nameColumnToPlot = "1990 Renewable Electricity Percentage of Total Electricity Output",
               catMethod = "fixedWidth",
               colourPalette = colourPalette, #diverging, heat
               numCats = 100) #10

#2015 Data
powerdata <- read_xlsx("Electricity Output.xlsx")

powerdata2015 <- aggregate(powerdata$`2015`,by=list(Country=powerdata$`Country Name`),FUN=sum)
colnames(powerdata2015)[colnames(powerdata2015)=="x"] <- "2015 Renewable Electricity Percentage of Total Electricity Output"

RenewableElectricityOutput2015 <- joinCountryData2Map(powerdata2015,
                                                  nameJoinColumn = "Country",
                                                  joinCode = "NAME")
#Set the color palette with RColorBrewer:
#colourPalette <- RColorBrewer::brewer.pal(10,"Spectral") #Purples
#colourPalette <- RColorBrewer::brewer.pal(9,"BuPu") #Purples
colourPalette <- RColorBrewer::brewer.pal(10,"RdBu") #Purples


#Plot the map using mapCountryData function from rworldmap:
mapCountryData(RenewableElectricityOutput2015,
               nameColumnToPlot = "2015 Renewable Electricity Percentage of Total Electricity Output",
               catMethod = "fixedWidth",
               colourPalette = colourPalette, #diverging, heat
               numCats = 100) #10


#1990 data
powerdata <- aggregate(powerdata$`1990`,by=list(Country=powerdata$`Country Name`),FUN=sum)
colnames(powerdata)[colnames(powerdata)=="x"] <- "1990 Renewable Electricity Percentage of Total Electricity Output"

RenewableElectricityOutput <- joinCountryData2Map(powerdata,
                                                  nameJoinColumn = "Country",
                                                  joinCode = "NAME")
#Set the color palette with RColorBrewer:
#colourPalette <- RColorBrewer::brewer.pal(10,"Spectral") #Purples
#colourPalette <- RColorBrewer::brewer.pal(9,"BuPu") #Purples
colourPalette <- RColorBrewer::brewer.pal(10,"RdBu") #Purples


#Plot the map using mapCountryData function from rworldmap:
mapCountryData(RenewableElectricityOutput,
               nameColumnToPlot = "1990 Renewable Electricity Percentage of Total Electricity Output",
               catMethod = "fixedWidth",
               colourPalette = colourPalette, #diverging, heat
               numCats = 100) #10

#increase data
powerdata <- read_xlsx("Electricity Output.xlsx")
powerdata <- powerdata %>% filter(increase<0.75)

powerincrease <- aggregate(powerdata$increase,by=list(Country=powerdata$`Country Name`),FUN=sum)
colnames(powerincrease)[colnames(powerincrease)=="x"] <- "Renewable Electricity Percentage Increase from 1990 to 2015"

RenewableElectricityIncrease <- joinCountryData2Map(powerincrease,
                                                      nameJoinColumn = "Country",
                                                      joinCode = "NAME")
#Set the color palette with RColorBrewer:
#colourPalette <- RColorBrewer::brewer.pal(10,"Spectral") #Purples
#colourPalette <- RColorBrewer::brewer.pal(9,"BuPu") #Purples
colourPalette <- RColorBrewer::brewer.pal(10,"RdBu") #Purples


#Plot the map using mapCountryData function from rworldmap:
mapCountryData(RenewableElectricityIncrease,
               nameColumnToPlot = "Renewable Electricity Percentage Increase from 1990 to 2015",
               catMethod = "fixedWidth",
               colourPalette = colourPalette, #diverging, heat
               numCats = 100) #10

quantile(powerdata$increase, prob=seq(0,1,length=11), type = 5)



