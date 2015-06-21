# set the url path for the download 
fileUrl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"

#set the working directory
setwd("~/R/RepData_PeerAssessment2")

# set up some working variables. These can be changed depending on your requirements
workingDir = getwd()
dataDir = "data"
fileName = "data/StormData.csv.bz2"


# create a data directory if one does not exist directory
if (!file.exists(dataDir)){
  dir.create(file.path(workingDir, dataDir))
}

# This setting is used to for https connections. Windows machine no curl installed
setInternet2(use = TRUE) #This needs to be set to support https. Could not use curl as not installed

if (!file.exists(fileName)){
  
  # download into the data directory
  download.file(fileUrl, fileName, method = "auto")
}


# load the csv in data frame
stormData <- read.csv(fileName, as.is=TRUE)

head(stormData)

names(stormData)

str(stormData)

stormData[,c("EVTYPE")] <- toupper(stormData[,c("EVTYPE")])

stormData[, "EVTYPE"]


sessioninfo()