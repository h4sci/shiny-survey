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
