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

### Reads relevant columns into tables and drops irrelevant columns
        skids_2013 <- read.csv("SKID STEERS 2013.csv")
        skids_2014 <- read.csv("SKID STEERS 2014.csv")
        newskid2014 <- skids_2014[c(1,2,4,9,11,13,16)]
        newskid2013 <- skids_2013[c(1,2,4,9,11,13,16)]

### Combines the datasets
        allskids <- rbind(newskid2013, newskid2014)

### Adds logical to find simplify tire option search
        allskids$solid10 <- allskids$TIRE.OPTIONS == ("10x16.5 Non-Pneumatic (64 OTW)")
        allskids$solid12 <- allskids$TIRE.OPTIONS == ("12x16.5 Non-Pneumatic (70 OTW)")

### Cleans global environment
        rm(newskid2013)
        rm(newskid2014)
        rm(skids_2013)
        rm(skids_2014)

### 

}        
        
        
       