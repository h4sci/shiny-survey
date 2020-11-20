library(shiny)
library(googlesheets4)
library(ggplot2)
library(googledrive)

# For local testing purposes (no deployment),
# just call gs4_auth() for pop-up authentication:

# gs4_auth()

# AND comment out the next line that employs one-time cached token info

gs4_auth(cache = ".secrets", email=TRUE)

sheet_id = "13KUyEUe0RIIy_gWEHds407geJpg3HouZmPSqvOdaTYE"
# full sheet link: 
# https://docs.google.com/spreadsheets/d/13KUyEUe0RIIy_gWEHds407geJpg3HouZmPSqvOdaTYE/edit?usp=sharing

updateData <- function(newData) {
  
  sheet_append(ss = sheet_id, 
               data = newData)
  sheet <- data.frame(read_sheet(sheet_id))
  return(sheet)
}

loadData <- function() {
  
  sheet <- data.frame(read_sheet(sheet_id))
  return(sheet)
}