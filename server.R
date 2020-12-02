library(shiny)
library(googlesheets4)
library(ggplot2)
library(googledrive)
library(shinydashboard)
library(rsconnect)

# For local testing purposes (no deployment),
# just call gs4_auth() for pop-up authentication:

# gs4_auth()

# AND comment out the next line that employs one-time cached token info
drive_auth(email = TRUE)
gs4_auth()

sheet_id = "1v0Dhyxozn3qz6WW54ZS03_qqO12g1Nzf5gXLBhgSmP0"
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


server <- function(input, output) {
  
  # TODO: load the exiting data first before the event
  
  # click Submit, append new data and load the full sheet
  fullData <- eventReactive(input$submit,{
    
    # currently there is only one column of "rating"
    # TODO: more columns of responses
    updateData(data.frame(ratings = c(input$ratings)))
    
  })
  
  # deliver the output value upon receiving the input data
  output$distPlot <- renderPlot({
    
    ggplot(fullData(), aes(ratings)) +
      geom_histogram(color="black",
                     fill="white",
                     binwidth=1) +
      scale_x_continuous(breaks = seq(1, 10, by = 1))
  })
  
}
