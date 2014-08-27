### A function to produce tidy data sets from Case SAP exports. ###

clean_data <- function() {
### Loads required packages and sets working directory
        if(!require("plyr")) {
                install.packages("plyr")
                require("plyr")
        }
        if(!require("reshape2")) {
                install.packages("reshape2")
                require("reshape2")
        }
        wd <- getwd()
        setwd(wd)

### Reads relevant columns into tables--Find a solution to only
### read relevant columns in to save memory
          
        skids_2013 <- read.csv("SKID STEERS 2013.csv")
        skids_2014 <- read.csv("SKID STEERS 2014.csv")
        newskid2014 <- skids_2014[c(-3,-5,-6,-8,-12,-14,-15,-17,-18,-19)]
        newskid2013 <- skids_2013[c(-3,-5,-6,-8,-12,-14,-15,-17,-18,-19)]

### Combines the datasets and re
        allskids <- rbind(newskid2013, newskid2014)

### Renames variables
        
        
       